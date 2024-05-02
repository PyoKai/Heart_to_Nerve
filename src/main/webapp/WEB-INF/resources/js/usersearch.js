/**
 * 
 */
const searchAlbums = document.getElementById('searchAlbums');
const searchArtists = document.getElementById('searchArtists');
const searchSongs = document.getElementById('searchSongs');
const noMatchResult = document.getElementById('noMatchResult');
function search() {
	
	var selectedType = document.getElementById('selectType').value;
	var searchTerm = document.getElementById('searchInput').value;
	if (selectedType === '2' && searchTerm !== "") {

		$.ajax({
			type: 'GET',
			url: '/HeartToNerve/get-UserSearchAlbums',
			dataType: 'json',
			data: {
				searchTerm: searchTerm
			},
			success: function(albums) {
				console.log(albums);
				if (albums.length > 0) {
				
					var playlistsElement = document.querySelector('.feedPlaylist .playlists');
					playlistsElement.innerHTML = ''; // Clear existing content
					albums.forEach(function(album) {
						var listItem = document.createElement('li');
						var anchor = document.createElement('a');
						anchor.href = 'systemalbum/' + album.id;
						anchor.style.textDecoration = 'none';
						anchor.style.color = 'white';

						var img = document.createElement('img');
						img.src = 'albumImages/' + album.image;
						anchor.appendChild(img);

						var span = document.createElement('span');
						span.textContent = album.name;
						anchor.appendChild(span);

						var paragraph = document.createElement('p');
						paragraph.innerHTML = '<br>' + album.artist_name;
						anchor.appendChild(paragraph);

						listItem.appendChild(anchor);
						playlistsElement.appendChild(listItem);
					});
					searchSongs.style.display='none';
					searchAlbums.style.display='inline';
					searchArtists.style.display='none';
					noMatchResult.style.display = 'none';
				}
				else {
					noMatchResult.innerHTML = '';
					var resultShowDiv = document.createElement('div');
					resultShowDiv.style.display = 'flex';
					resultShowDiv.style.alignItems = 'center';
					resultShowDiv.style.justifyContent = 'center';
					resultShowDiv.style.flexDirection = 'column';
					var resultShowh4 = document.createElement('span');
					resultShowh4.textContent = "No matched result is founded.";
					resultShowDiv.appendChild(resultShowh4);
					noMatchResult.appendChild(resultShowDiv);
					noMatchResult.style.display = 'inline';
					searchAlbums.style.display = 'none';
				}
			},
			error: function() {
			}

		})
	}
	else if (selectedType === '3' && searchTerm !== "") {
		$.ajax({
			type: 'GET',
			url: '/HeartToNerve/get-UserSearchArtists',
			dataType: 'json',
			data: {
				searchTerm: searchTerm
			},
			success: function(artists) {
				console.log("array length" + artists.length);
				if (artists.length > 0) {
			
					var playlistsElement = document.querySelector('#searchArtists .playlists');
					playlistsElement.innerHTML = ''; // Clear existing content

					artists.forEach(function(artist) {
						var listItem = document.createElement('li');
						var anchor = document.createElement('a');
						anchor.href = 'systemartistpage/' + artist.id;
						anchor.style.textDecoration = 'none';
						anchor.style.color = 'white';

						var img = document.createElement('img');
						img.src = 'images/' + artist.image;
						anchor.appendChild(img);

						var span = document.createElement('span');
						span.textContent = artist.name;
						anchor.appendChild(span);

						listItem.appendChild(anchor);
						playlistsElement.appendChild(listItem);
					});
					searchSongs.style.display='none';
					searchAlbums.style.display='none';
					searchArtists.style.display='inline';
					noMatchResult.style.display = 'none';
					
				}
				else {
					noMatchResult.innerHTML = '';
					var resultShowDiv = document.createElement('div');
					resultShowDiv.style.display = 'flex';
					resultShowDiv.style.alignItems = 'center';
					resultShowDiv.style.justifyContent = 'center';
					resultShowDiv.style.flexDirection = 'column';
					var resultShowh4 = document.createElement('span');
					resultShowh4.textContent = "No matched result is founded";
					resultShowDiv.appendChild(resultShowh4);
					noMatchResult.appendChild(resultShowDiv);
					noMatchResult.style.display = 'inline';
					searchArtists.style.display = 'none';
				}

			},
			error: function() {
			}
		})
	}
	else if (selectedType === '1' && searchTerm !== "") {
		$.ajax({
			type: 'GET',
			url: '/HeartToNerve/get-UserSearchSongs',
			dataType: 'json',
			data: { searchTerm: searchTerm },
			success: function(songs) {
				const heartButtonTag = document.querySelector('.heartButton');
				const songInfoTag = document.getElementById('songInfo');
				const playlistContainerTag = document.querySelector(".playlistContainer");
				const currentAndTotalTimeTag = document.getElementsByClassName("currentAndTotalTime")[0];
				const audioTag = document.querySelector(".audioTag");
				const currentProgressTag = document.getElementById("currentProgress");
				const playButtonTag = document.getElementsByClassName("playButton")[0];
				const pauseButtonTag = document.getElementsByClassName("pauseButton")[0];
				const nextButtonTag = document.getElementsByClassName("nextButton")[0];
				const previousButtonTag = document.getElementsByClassName("previousButton")[0];
				playlistContainerTag.innerHTML='';
				let isFavourite = false;
				let currentPlayingIndex = 0;
			/*	const tracks = songs || [];*/
				let tracks = [];
				tracks = null;
				tracks = songs || [];
				console.log(tracks);
				if (tracks.length > 0) {
					searchSongs.style.display='inline';
					searchAlbums.style.display='none';
					searchArtists.style.display='none';
					noMatchResult.style.display = 'none';
					
					for (let i = 0; i < tracks.length; i++) {
						const trackRow = document.createElement("tr");
						const trackNumberCell = document.createElement("td");
						const trackTitleCell = document.createElement("td");
						const trackDurationCell = document.createElement("td");

						const playButtonCell = document.createElement("td");

						const playSongButton = document.createElement("button");
						playSongButton.textContent = "Play";
						playSongButton.classList.add("btn", "btn-primary");
						trackNumberCell.textContent = (i + 1).toString();
						trackTitleCell.textContent = tracks[i].title;
						trackDurationCell.textContent = tracks[i].duration;

						playButtonCell.appendChild(playSongButton);
						trackRow.appendChild(trackNumberCell);
						trackRow.appendChild(trackTitleCell);
						trackRow.appendChild(trackDurationCell);
						trackRow.appendChild(playButtonCell);
						playlistContainerTag.appendChild(trackRow);

						playSongButton.addEventListener("click", () => {
							const trackId = tracks[i].trackId;
							audioTag.src = trackId;
							audioTag.play();
							isPlaying = true;
							updatePlayAndPauseButton();
							currentPlayingIndex = i;
							songInfoProgress(currentPlayingIndex);
							
						});
					}
					const pTag = document.createElement('p');
					const span = document.createElement('span');
					const heartLi = document.createElement('i');
					heartLi.style.cursor = 'pointer';
					const div = document.createElement('div');
					const heartDiv = document.createElement('div');
					const songInfoProgress = (i) => {
						
						heartLi.className = 'far fa-heart';
						heartLi.id = 'btn' + i;
						pTag.textContent = tracks[i].title;
						span.textContent = tracks[i].artistName;

						div.appendChild(pTag);
						div.appendChild(span);
						heartDiv.appendChild(heartLi);
						songInfoTag.innerHTML = '';
						songInfoTag.appendChild(div);
						heartButtonTag.innerHTML = '';
						heartButtonTag.appendChild(heartDiv);

						$.ajax({
							type: 'GET',
							url: '/HeartToNerve/check-userFavouriteSong',
							data: { userId: userId, songId: tracks[i].id },
							dataType: 'json',
							success: function(isFavouriteSong) {
								isFavourite = isFavouriteSong;
								console.log("Is song liked? ", isFavouriteSong);
								const btn = document.getElementById('btn' + i);
								console.log("Button element: ", btn);
								if (isFavouriteSong) {
									btn.classList.remove("far");
									btn.classList.add("fas");

								}
								else {
									btn.classList.remove("fas");
									btn.classList.add("far");
								}
							},

							error: function() {

							}
						});
					}
					heartLi.addEventListener('click', function() {
						isFavourite = !isFavourite;
						console.log(isFavourite);
						if (isFavourite) {

							heartLi.classList.remove("far");
							heartLi.classList.add("fas");
							$.ajax({
								type: 'POST',
								url: '/HeartToNerve/save-userFavouriteSong',
								data: { userId: userId, songId: tracks[currentPlayingIndex].id },
								dataType: 'json',
								success: function() {

								},
								error: function() {

								}
							});
						}
						else {
							heartLi.classList.remove("fas");
							heartLi.classList.add("far");
							console.log(tracks[currentPlayingIndex].id);

							$.ajax({
								type: 'POST',
								url: '/HeartToNerve/remove-userFavouriteSong',
								data: { userId: userId, songId: tracks[currentPlayingIndex].id },
								dataType: 'json',
								success: function() {

								},
								error: function() {

								}
							});
						}
					})
					let duration = 0;
					let durationText = "00:00";
					audioTag.addEventListener("loadeddata", () => {
						duration = Math.floor(audioTag.duration);
						durationText = createMinuteAndSecondText(duration);


					});

					audioTag.addEventListener("timeupdate", () => {
						const currentTime = Math.floor(audioTag.currentTime);
						const currentTimeText = createMinuteAndSecondText(currentTime);
						const currentTimeTextAndDurationText = currentTimeText + " / " + durationText;
						currentAndTotalTimeTag.textContent = currentTimeTextAndDurationText;
						updateCurrentProgress(currentTime);

					});

					
					let isPlaying = false;
					playButtonTag.addEventListener("click", () => {

						const currentTime = Math.floor(audioTag.currentTime);
						isPlaying = true;
						if (currentTime === 0) {
							const songIdToPlay = tracks[currentPlayingIndex].trackId;
							songInfoProgress(currentPlayingIndex);
							audioTag.src = songIdToPlay;
							audioTag.play();
							updatePlayAndPauseButton();
						}
						else {
							audioTag.play();
							updatePlayAndPauseButton();
						}

					});
					previousButtonTag.addEventListener("click", () => {
						if (currentPlayingIndex === 0) {
							return;
						}
						currentPlayingIndex -= 1;
						const songIdToPlay = tracks[currentPlayingIndex].trackId;
						songInfoProgress(currentPlayingIndex);
						audioTag.src = songIdToPlay;
						audioTag.play();
						isPlaying = true;
						updatePlayAndPauseButton();
					});
					nextButtonTag.addEventListener("click", () => {
						if (currentPlayingIndex === tracks.length - 1) {
							return;
						}
						currentPlayingIndex += 1;
						console.log("CurrentPlaying : " + currentPlayingIndex)
						const songIdToPlay = tracks[currentPlayingIndex].trackId;
						songInfoProgress(currentPlayingIndex);
						audioTag.src = songIdToPlay;
						audioTag.play();
						isPlaying = true;
						updatePlayAndPauseButton();
					});
					pauseButtonTag.addEventListener("click", () => {
						isPlaying = false;
						audioTag.pause();
						updatePlayAndPauseButton();
					});
					const updatePlayAndPauseButton = () => {
						if (isPlaying) {
							playButtonTag.style.display = "none";
							pauseButtonTag.style.display = "inline";
						}
						else {
							playButtonTag.style.display = "inline";
							pauseButtonTag.style.display = "none";
						}
					}

					const updateCurrentProgress = (currentTime) => {
						const currentProgressWidth = (500 / duration) * currentTime;
						currentProgressTag.style.width = currentProgressWidth.toString() + "px";
					};



					const createMinuteAndSecondText = (totalSecond) => {
						const minutes = Math.floor(totalSecond / 60);
						const seconds = totalSecond % 60;

						const minuteText = minutes < 10 ? "0" + minutes.toString() : minutes;
						const secondText = seconds < 10 ? "0" + seconds.toString() : seconds;
						return minuteText + ":" + secondText;
					};
				}
				else {
					noMatchResult.innerHTML = '';
					var resultShowDiv = document.createElement('div');
					resultShowDiv.style.display = 'flex';
					resultShowDiv.style.alignItems = 'center';
					resultShowDiv.style.justifyContent = 'center';
					resultShowDiv.style.flexDirection = 'column';
					var resultShowh4 = document.createElement('span');
					resultShowh4.textContent = "No matched result is founded";
					resultShowDiv.appendChild(resultShowh4);
					noMatchResult.appendChild(resultShowDiv);
					noMatchResult.style.display = 'inline';
					searchSongs.style.display = 'none';
				}
			},
			error: function() {
					
			}
		})
	}
}