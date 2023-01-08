from renderer import *
from colors import get_nord_colors

np = get_nord_colors()

# Init renderer.
renderer = Renderer()
renderer.distribute_evenly = True 

# Header.
header_text = Text("This is the header!")
header_text.has_border = True
header_text.border_fg = np["cyan"]
header_text.text_fg = np["white2"]
header_text.stretch_horizontal = True
header_text.bold = True
header_text.padding = [0,1]
renderer.submit_header(header_text)

# Credits.
creds = Text("@AlexvZyl (alexandervanzyl@protonmail.com)")
creds.italic = True
creds.text_fg = np["white0"]
creds.stretch_horizontal = True
creds.alignment = "right"
renderer.submit_header(creds)

# Main parts.
text = Text("This is some text.")
text.text_fg = np["white2"]
text.alignment = "center"
text.stretch_horizontal = True
renderer.submit(text)
renderer.submit(text)
text.string = "Ha"
renderer.submit(text)

# Test a confirm widget.
confirm = Confirm("Are you sure?")
confirm.stretch_horizontal = True
confirm.alignment = "center"
# renderer.submit(confirm)

# Test the list.
list = List(["A", "B", "C", "D", "E", "F", "G", "H"]) 
# renderer.submit(list)

spinner = Spinner(["sleep", "3"])
# renderer.submit(spinner)

# Render everything.
renderer.render()
