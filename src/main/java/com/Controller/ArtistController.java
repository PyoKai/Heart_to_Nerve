package com.Controller;

import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DAO.ArtistDAO;
import com.DTO.ArtistDTO;
import com.DTO.ArtistRequestDTO;
import com.DTO.ArtistResponseDTO;
import com.Model.ArtistBean;

@Controller
public class ArtistController {
	@Autowired
	private ArtistDAO art;

	@RequestMapping(value = "/artistaddform", method = RequestMethod.GET)
	public ModelAndView artist(HttpSession session) {

		if (session.getAttribute("adminId") == null) {
			return new ModelAndView("redirect:/login");

		} else {

			ModelAndView mv = new ModelAndView("artistAdd", "artist", new ArtistDTO());
			return mv;
		}
	}

	@RequestMapping(value = "/artistregister", method = RequestMethod.POST)
	public String artistRegister(@ModelAttribute("artist") @Validated ArtistDTO obj, BindingResult br, ModelMap m,
			@RequestParam("image") CommonsMultipartFile file) {
		if (br.hasErrors()) {
			System.out.println("Error");
			return "artistAdd";

		}

		ArtistRequestDTO dto = new ArtistRequestDTO();
		/* dto.setId(obj.getId()); */
		dto.setName(obj.getName());
		dto.setDescription(obj.getDescription());
		dto.setEmail(obj.getEmail());

		// check file dir if not exist, create

		// get image path url
		String fileUrl = UUID.randomUUID() + "_" + file.getOriginalFilename();

		// check file is not null
		if (file != null && file.getSize() > 0 && !file.isEmpty()) {
			try {
//						File uploadDir = new File(session.getServletContext().getRealPath("/images/"));
				File uploadDir = new File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/images");
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				file.transferTo(new File(uploadDir, fileUrl));
				/* file.transferTo(Path.of(uploadDir+fileUrl)); */
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		dto.setImage(fileUrl);
		int rs = art.insertData(dto);
		if (rs == 0) {
			m.addAttribute("error", "insert failed!!");
			return "artistAdd";
		}

		if (rs == 2) {
			m.addAttribute("erroremail", "Email already exists. Please use different email.");
			return "artistAdd";
		}

		return "redirect:/artistmanagement";
	}

	@RequestMapping(value = "/artistmanagement", method = RequestMethod.GET)
	public String artistManagement(ModelMap model, HttpSession session) {

		if (session.getAttribute("adminId") == null) {
			return "redirect:/login";
		} else {

			ArrayList<ArtistResponseDTO> list = art.selectAll();
			model.addAttribute("artistList", list);

			return "artist";
		}
	}

	@RequestMapping(value = "/artistupdateform/{id}", method = RequestMethod.GET)
	public ModelAndView setupUpdate(@PathVariable int id, HttpSession session) {

		if (session.getAttribute("adminId") == null) {
			return new ModelAndView("redirect:/login");

		} else {

			ArtistRequestDTO dto = new ArtistRequestDTO();
			dto.setId(id);
			ModelAndView mv = new ModelAndView("artistupdate", "updateartist", art.selectOne(dto));
			return mv;
		}
	}

	@RequestMapping(value = "/artistupdateform/artist_update", method = RequestMethod.POST)
	public String updateartist(@ModelAttribute("updateartist") @Validated ArtistBean obj, BindingResult bs, ModelMap m,
			@RequestParam("newImage") CommonsMultipartFile newFile) {

		if (bs.hasErrors()) {
			return "artistupdate";

		}

		ArtistRequestDTO dto = new ArtistRequestDTO();
		dto.setId(obj.getId());

		dto.setName(obj.getName());

		dto.setDescription(obj.getDescription());

		dto.setEmail(obj.getEmail());

		// To Delete image from server
		String directoryPath = "D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/images";
		System.out.println("File isEmpty?" + newFile.isEmpty());
		if (!newFile.isEmpty()) {
			String fileNameToDelete = art.selectImage(obj.getId());
			System.out.println("FileNameToDelete  :"+fileNameToDelete);
			File fileToDelete = new File(directoryPath + fileNameToDelete);
			if (fileToDelete.exists() && fileToDelete.isFile()) {
				// Attempt to delete the file
				if (fileToDelete.delete()) {
					System.out.println("File deleted successfully.");
				} else {
					System.out.println("Failed to delete the file.");
				}
			} else {
				System.out.println("File does not exist or is not a file.");
			}
			String fileUrl = UUID.randomUUID() + "_" + newFile.getOriginalFilename();
			if (newFile != null && newFile.getSize() > 0 && !newFile.isEmpty()) {
				try {
//					File uploadDir = new File(session.getServletContext().getRealPath("/images/"));
					File uploadDir = new File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/images");
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					newFile.transferTo(new File(uploadDir, fileUrl));
					dto.setImage(fileUrl);
					/* file.transferTo(Path.of(uploadDir+fileUrl)); */
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		else {
			String fileUrl = art.selectImage(dto.getId());
			dto.setImage(fileUrl);
		}
		/*
		 * else {
		 * 
		 * System.out.println("Image Url :  "+fileUrl); try { // File uploadDir = new
		 * File(session.getServletContext().getRealPath("/images/")); File uploadDir =
		 * new
		 * File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/images");
		 * if(!uploadDir.exists()) { uploadDir.mkdir(); } newFile.transferTo(new
		 * File(uploadDir,fileUrl));
		 * 
		 * file.transferTo(Path.of(uploadDir+fileUrl)); }catch (IOException e) {
		 * e.printStackTrace(); }
		 * 
		 * }
		 */

		// To Replace newImageFile with deleted image

		int rs = art.updateData(dto);
		if (rs == 0) {
			m.addAttribute("error", "Update Failed");

			return "artistupdate";
		}
		if (rs == 2) {
			m.addAttribute("erroremail", "Email already exists. Please use a different email.");
			return "artistupdate";
		}
		/* redirectAttributes.addAttribute("id",obj.getId()); */
		return "redirect:/artistmanagement";
	}

	@RequestMapping(value = "/deleteartist/{id}", method = RequestMethod.GET)
	public String deleteartist(@PathVariable int id, ModelMap m, HttpSession session) {

		if (session.getAttribute("adminId") == null) {
			return "redirect:/login";
		} else {

			ArtistRequestDTO dto = new ArtistRequestDTO();
			dto.setId(id);
			// Specify the path to the directory where the image is stored
			String directoryPath = "D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/images";

			// Specify the file name you want to delete

			String fileNameToDelete = art.selectImage(dto.getId()); // Replace with the actual file name

			// Create a File object with the full path to the file to delete
			File fileToDelete = new File(directoryPath + fileNameToDelete);

			int rs = art.deleteData(dto);
			if (rs == 0) {
				m.addAttribute("error", "Delete Failed");
				return "artist";
			}
			// Check if the file exists and is a file (not a directory)
			if (fileToDelete.exists() && fileToDelete.isFile()) {
				// Attempt to delete the file
				if (fileToDelete.delete()) {
					System.out.println("File deleted successfully.");
				} else {
					System.out.println("Failed to delete the file.");
				}
			} else {
				System.out.println("File does not exist or is not a file.");
			}

			return "redirect:/artistmanagement";
		}
	}

}