/**
 * 
 */
const heartButtonTag = document.querySelector('.heartButton');
const playlistsRecentes = document.getElementById('playlistsRecentes');
const currentAndTotalTimeTag = document.getElementsByClassName("currentAndTotalTime")[0];
const audioTag = document.querySelector(".audioTag");
const currentProgressTag = document.getElementById("currentProgress");
const playButtonTag = document.getElementsByClassName("playButton")[0];
const pauseButtonTag = document.getElementsByClassName("pauseButton")[0];
const nextButtonTag = document.getElementsByClassName("nextButton")[0];
const previousButtonTag = document.getElementsByClassName("previousButton")[0];
const songInfoTag = document.getElementById('songInfo');
let isFavourite = false;

//insert a
var userId = userId;
$.ajax({
	type: 'GET',
	url: '/HeartToNerve/get-popularsongs',
	dataType: 'json',
	// data: {
	// 	alblumId: albumId
	// },
	success: function(songs) {

		const tracks = songs || [];
		console.log(songs);

		let currentPlayingIndex;
		for (let i = 0; i < tracks.length; i++) {

			const li = document.createElement("li");
			li.className = 'song';
			const img = document.createElement('img');
			img.src = 'albumImages/' + tracks[i].image;
			img.alt = 'Song Image';

			const span = document.createElement('span');
			span.className = 'fw-semibold ms-3 me-auto';
			span.textContent = tracks[i].name;

			const playSongbutton = document.createElement('button');
			playSongbutton.type = 'button';
			playSongbutton.className = 'btn me-3';
			playSongbutton.innerHTML = '<svg role="img" height="24" width="24" viewBox="0 0 24 24"><path d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z"></path></svg>';

			li.appendChild(img);
			li.appendChild(span);
			li.appendChild(playSongbutton);
			playlistsRecentes.appendChild(li);

			playSongbutton.addEventListener("click", () => {
				const trackId = tracks[i].trackId;
				audioTag.src = trackId;
				audioTag.play();
				isPlaying = true;
				songInfoProgress(i);
				updatePlayAndPauseButton();
				currentPlayingIndex = i;
			});
		}
		
		const pTag = document.createElement('p');
		const span = document.createElement('span');

		const heartLi = document.createElement('i');
		heartLi.style.cursor = 'pointer';


		const songInfoProgress = (i) => {
			const div = document.createElement('div');
			const heartDiv = document.createElement('div');
			heartLi.className = 'far fa-heart';
			heartLi.id = 'btn' + i;
			pTag.textContent = tracks[i].name;
			span.textContent = tracks[i].artistName;

			div.appendChild(pTag);
			div.appendChild(span);
			heartDiv.appendChild(heartLi);
			songInfoTag.appendChild(div);
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
		};
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

		currentPlayingIndex = 0;
		let isPlaying = false;
		playButtonTag.addEventListener("click", () => {


			const currentTime = Math.floor(audioTag.currentTime);
			isPlaying = true;
			if (currentTime === 0) {
				const songIdToPlay = tracks[currentPlayingIndex].trackId;
				songInfoProgress(currentPlayingIndex);
				console.log(songIdToPlay);
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


	},
	error: function(xhr, status, error) {
		// Handle errors
		console.error('Error:', error);
	}
});

