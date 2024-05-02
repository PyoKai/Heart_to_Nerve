package com.Service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MyService {

	public String imageUpload(CommonsMultipartFile file) {
		// check file dir if not exist, create

		// get image path url
		String fileUrl = UUID.randomUUID() + "_" + file.getOriginalFilename();

		// check file is not null
		if (file != null && file.getSize() > 0 && !file.isEmpty()) {
			try {
//				File uploadDir = new File(session.getServletContext().getRealPath("/images/"));
				File uploadDir = new File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/albumImages/");
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				file.transferTo(new File(uploadDir, fileUrl));
				/* file.transferTo(Path.of(uploadDir+fileUrl)); */
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileUrl;
	}

	public void deleteImage(String fileNameToDelete) {
		// Specify the path to the directory where the image is stored
		String directoryPath = "D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/albumImages/";
		File fileToDelete = new File(directoryPath + fileNameToDelete);
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
	}

	public String updateImage(String fileName, CommonsMultipartFile newFile) {
		String fileUrl = "";
		String directoryPath = "D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/albumImages/";
		if (!newFile.isEmpty()) {
			File fileToDelete = new File(directoryPath + fileName);
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
			fileUrl = UUID.randomUUID() + "_" + newFile.getOriginalFilename();
			if (newFile != null && newFile.getSize() > 0 && !newFile.isEmpty()) {
				try {
//					File uploadDir = new File(session.getServletContext().getRealPath("/images/"));
					File uploadDir = new File(
							"D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/albumImages/");
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					newFile.transferTo(new File(uploadDir, fileUrl));
					/* file.transferTo(Path.of(uploadDir+fileUrl)); */
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			fileUrl = fileName;
			/*
			 * try { File uploadDir = new
			 * File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/albumImages/"
			 * ); if(!uploadDir.exists()) { uploadDir.mkdir(); } newFile.transferTo(new
			 * File(uploadDir,fileUrl)); file.transferTo(Path.of(uploadDir+fileUrl)); }catch
			 * (IOException e) { e.printStackTrace(); }
			 */
		}

		return fileUrl;
	}

	public String songUpload(CommonsMultipartFile file) {
		String fileUrl = UUID.randomUUID() + "_" + file.getOriginalFilename();
		if (file != null && file.getSize() > 0 && !file.isEmpty()) {
			try {
//				File uploadDir = new File(session.getServletContext().getRealPath("/images/"));
				File uploadDir = new File("D:/Phyoe/Music Project/HeartToNerve/src/main/webapp/WEB-INF/songFiles/");
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				file.transferTo(new File(uploadDir, fileUrl));
				/* file.transferTo(Path.of(uploadDir+fileUrl)); */
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileUrl;
	}
	
	public void deleteSongFile(String fileNameToDelete) {
		// Specify the path to the directory where the image is stored
				String directoryPath = "D:/ACE/hearttonerve/src/main/webapp/WEB-INF/songFile/";
				File fileToDelete = new File(directoryPath + fileNameToDelete);
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
	}
}
