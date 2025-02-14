function setImageSource(src) {
  const image = document.querySelector('img')
  if (image) {
    image.src = src
  }
}

function toggleFullscreen() {
  if (!document.fullscreenElement) {
    enterFullScreen()
  } else {
    exitFullscreen()
  }
}

function exitFullscreen() {
  if (document.fullscreenElement) {
    document.exitFullscreen()
  }
}

function enterFullScreen() {
  if (!document.fullscreenElement) {
    const body = document.querySelector('body')
    body.requestFullscreen()
  }
}
