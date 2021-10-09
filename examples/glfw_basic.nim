import boxy, opengl, staticglfw

let windowSize = vec2(1280, 800)

if init() == 0:
  quit("Failed to Initialize GLFW.")

windowHint(RESIZABLE, false.cint)

let window = createWindow(
  windowSize.x.cint, windowSize.y.cint, "GLFW + Boxy", nil, nil
)

makeContextCurrent(window)
loadExtensions()

let bxy = newBoxy()

let rhino = readImage("examples/data/rhino.png")
bxy.addImage("rhino", rhino)

var i: int

# Called when it is time to draw a new frame.
proc display() =
  # Clear the screen and begin a new frame.
  bxy.beginFrame(windowSize)
  # Draw the white background.
  bxy.drawRect(rect(vec2(0, 0), windowSize), color(1, 1, 1, 1))
  # Draw the rhino.
  bxy.drawImage("rhino", vec2((i mod windowSize.x.int).float32, 0))
  # End this frame, flushing the draw commands.
  bxy.endFrame()
  # Swap buffers displaying the new Boxy frame.
  window.swapBuffers()
  inc i

while windowShouldClose(window) != 1:
  pollEvents()
  display()