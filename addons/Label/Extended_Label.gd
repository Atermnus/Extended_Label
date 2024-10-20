@tool
extends Label
## Extended Label.

## Uses [method tr()] to translate a text. If no text is found, reverts to what is written originally.
@export var TEXT_TO_TRANSLATE : String

enum SIZE{
	SMALLEST , ## Smallest possible text. Used for small tooltips.
	SMALL, ## Small text. Used for big messages like chat etc.
	MEDIUM, ## Medium text. Should be used for item titles/etc.
	MEDIUMER, ## Medium-er text. Should be used for names, headlines.
	BIG, ## Big text. Should be used for UI messages.
	LARGE, ## Large text. Should be used as subtitle along Largest for messages you want to cover the entire screen.
	LARGEST ## Largest text. Should be used for messages that you want to cover the entire screen.
}

## Sets the size of the text.
@export var TEXT_SIZE : SIZE :
	set(value):
		TEXT_SIZE = value
		set_label_size()

## Current resolution. Automatically set to 1920x1080.
var resolution : Vector2 = Vector2(1920,1080)


## Sets label size. Should be called whenever you change screen resolution.
func set_label_size():


	resolution = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"),ProjectSettings.get_setting("display/window/size/viewport_height"))

	set("theme_override_font_sizes/font_size",FONT_SIZES[TEXT_SIZE][resolution])

	
#--------------------------------------------------------------------


## FONT SIZES. Mess with this if you don't like the sizes.
@export var FONT_SIZES : Array[Dictionary] = [{
#### SMALLEST
	Vector2(1152,648) : 10,
	Vector2(1280,800) : 10,
	Vector2(1377,966) : 11,
	Vector2(1680,1050) : 12,
	Vector2(1920,1080) : 13,
	Vector2(2560,1440) : 15
},
#### SMALL
{
	Vector2(1152,648) : 11,
	Vector2(1280,800) : 11,
	Vector2(1377,966) : 12,
	Vector2(1680,1050) : 13,
	Vector2(1920,1080) : 14,
	Vector2(2560,1440) : 16
},
#### MEDIUM
{
	Vector2(1152,648) : 12,
	Vector2(1280,800) : 12,
	Vector2(1377,966) : 13,
	Vector2(1680,1050) : 15,
	Vector2(1920,1080) : 16,
	Vector2(2560,1440) : 20
},
#### MEDIUMER
{
	Vector2(1152,648) : 13,
	Vector2(1280,800) : 13,
	Vector2(1377,966) : 14,
	Vector2(1680,1050) : 18,
	Vector2(1920,1080) : 20,
	Vector2(2560,1440) : 24
},
#### BIG
{
	Vector2(1152,648) : 16,
	Vector2(1280,800) : 16,
	Vector2(1377,966) : 18,
	Vector2(1680,1050) : 20,
	Vector2(1920,1080) : 24,
	Vector2(2560,1440) : 28
},
#### LARGER
{
	Vector2(1152,648) : 18,
	Vector2(1280,800) : 18,
	Vector2(1377,966) : 20,
	Vector2(1680,1050) : 22,
	Vector2(1920,1080) : 26,
	Vector2(2560,1440) : 30
},
#### LARGEST
{
	Vector2(1152,648) : 20,
	Vector2(1280,800) : 20,
	Vector2(1377,966) : 22,
	Vector2(1680,1050) : 24,
	Vector2(1920,1080) : 30,
	Vector2(2560,1440) : 36
},
]


## COLORS. Mess with this to add new colours or change the current ones.
## Friendly tip, ALWAYS use "passive" or "darkish" colours. Bright colours should be reserved
## [br]for special occassions
@export var COLOR_DICTIONARY : Dictionary ={
	"RED" : Color("fdf0eb"),
	"WHITE" : Color("e0e0e0"),
	"BLACK" : Color("404040"),
	"CYAN" : Color("d3eff0"),
	"GRAY" : Color("8b8b8b"),
	"YELLOW" : Color("fff4cb"),
	"LIME" : Color("53f7a6"),
	"DARK_RED" : Color("b73f43")
}

## Change the color. If you add a new color to the COLOR_DICTIONARY, ADD it here as well.
@export_enum("RED","YELLOW","WHITE","BLACK","CYAN","GRAY","LIME","DARK_RED") var COLOR : String :
	set(value):
		COLOR = value
		add_theme_color_override("font_color",COLOR_DICTIONARY[COLOR])


func _ready() -> void:
	if TEXT_TO_TRANSLATE.length() > 0:
		text = tr(TEXT_TO_TRANSLATE)
	set_label_size()
	
	

	
