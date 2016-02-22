'From VisualWorks®, 8.1 of 24 July, 2015 on 21 February, 2016 at 6:01:02 PM'!


CodeComponent create: #package named: 'Battlesnake'!"Package Battlesnake(1.0 - 2016 Competition,jkott)="!


CodeComponent type: #package named: 'Battlesnake' property: #prerequisiteParcels value: #(#('SiouX-Server' '') #('Xtreams-Transforms' '') #('AppeX-Core' '') #('SiouX-Tools' '') #('AppeX-Tools' ''))!

CodeComponent type: #package named: 'Battlesnake' property: #developmentPrerequisites value: #(#(#any 'SiouX-Server' '') #(#any 'Xtreams-Transforms' '') #(#any 'AppeX-Core' '') #(#any 'SiouX-Tools' '') #(#any 'AppeX-Tools' ''))!

CodeComponent type: #package named: 'Battlesnake' property: #prerequisiteDescriptions value: #(#(#name 'SiouX-Server' #componentType #bundle) #(#name 'Xtreams-Transforms' #componentType #package) #(#name 'AppeX-Core' #componentType #package) #(#name 'SiouX-Tools' #componentType #package) #(#name 'AppeX-Tools' #componentType #bundle))!

Smalltalk defineNameSpace: #Battlesnake
	private: false
	imports: '
			private Core.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #PathNode
	superclass: #{Core.Object}
	indexedType: #none
	private: false
	instanceVariableNames: 'tile costFromStart costToTarget parentNode distanceFromStart target costOfTravel costOfRisk '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #TileContent
	superclass: #{Core.Object}
	indexedType: #none
	private: false
	instanceVariableNames: 'tile '
	classInstanceVariableNames: ''
	imports: '
			Xtreams.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #Food
	superclass: #{Battlesnake.TileContent}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #Board
	superclass: #{Core.Announcer}
	indexedType: #none
	private: false
	instanceVariableNames: 'rows snakes foods goldCoins walls medusa game '
	classInstanceVariableNames: ''
	imports: '
			Xtreams.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #TileStateChanged
	superclass: #{Core.Announcement}
	indexedType: #none
	private: false
	instanceVariableNames: 'tile '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #Wall
	superclass: #{Battlesnake.TileContent}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #BoardTile
	superclass: #{Core.Announcer}
	indexedType: #none
	private: false
	instanceVariableNames: 'north east south west neighbours position content board pathCache '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #Snake
	superclass: #{Core.Object}
	indexedType: #none
	private: false
	instanceVariableNames: 'head snakeName board segments liveStatus kills color headUrl lastPosition health '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Battlesnake.Snake comment:
'Snake has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	board	<AlphaCompositedImage | Board | FlowLine | FlowParagraph | FlowSegment | GraphicsMedium | Grid | Label | LayoutSizedOrigin | OrderedDither | PixelArray | RasterOp | Rectangle | SimpleStringLabel | TextLines | WindowOpenPositionToolModel>	description of board
	bubble	<Collection>	description of bubble
	head	<AbstractBinaryObjectStorage | BoardTile | ByteCodeStream | DatabaseField | EncodedStream | GenericSettingDescriptor | MenuItem | MenuItemInsertion | NullStream | PathNode | PositionableStream | PostgresLOB | ProgressWidgetSpec | RBErrorAction | ReadStream | RectangleEdge | SettingsManagerPage | StandardIOStream | SyntaxErrorException | TextCollector | TileContent | UnsupportedCharacterError | WriteStream>	description of head
	segments	<SequenceableCollection>	description of segments
	snakeName	<JavascriptCode | MessageForwarder | Object | ProtoObject | ProtoObject>	description of snakeName

Strategy:
1) Receive board state
2) Parse the board for food and snakes (boardtile with boardtile contents, and snake objects)
3) Slither:
Do I have a path?
	ifTrue:[
		Has the path changed?
		ifTrue:[Snake findPathTo: (Snake findTarget).]	
			
	]
	ifFalse:[Snake findPathTo: (Snake findTarget).
	]
	Snake move - moves to first tile in path instance variable, and decreases path to move first tile.

Method: slither - returns self
Method: findTarget - returns a tile
	calls methods:
	- findFoodTile - returns foodTile or nil
	- findSmallsnakeTile - returns tile or nil
	- runAwayFrom:aTile - returns safetyTile or nil
	- findPerimeter - return clear wall tile on farthest wall (if width is > 50% of width of board) or nearest wall (remember bubble tiles!!)
Method: findPathTo: aTile -- returns a path
Method: snake move -- returns self
Instance variable: addWiggle(boolean) - adds additional tiles to your path'!

Smalltalk.Battlesnake defineClass: #Medusa
	superclass: #{Battlesnake.Snake}
	indexedType: #none
	private: false
	instanceVariableNames: 'behaviors path bubble target nextMove currentBehavior '
	classInstanceVariableNames: 'tauntSelector '
	imports: ''
	category: ''!

Battlesnake.Medusa comment:
'Medusa has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	path	<OrderedCollection of <Tile>>	path I am about to take.
	strategies	<OrderedCollection>	collection of blocks that when evaluated, will determine the next behaviour.



'!

Smalltalk.Battlesnake defineClass: #GoldCoin
	superclass: #{Battlesnake.TileContent}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #SnakePart
	superclass: #{Battlesnake.TileContent}
	indexedType: #none
	private: false
	instanceVariableNames: 'snake nextSegment '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #Head
	superclass: #{Battlesnake.SnakePart}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #WormHole
	superclass: #{AppeX.Application}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: 'activeGame '
	imports: '
			private OS.*
			private Xtreams.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #WormHoleClient
	superclass: #{AppeX.ApplicationClient}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #BoardStateChanged
	superclass: #{Core.Announcement}
	indexedType: #none
	private: false
	instanceVariableNames: 'tile '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #Game
	superclass: #{Core.Object}
	indexedType: #none
	private: false
	instanceVariableNames: 'board medusa gameName turn '
	classInstanceVariableNames: ''
	imports: '
			private Xtreams.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #Body
	superclass: #{Battlesnake.SnakePart}
	indexedType: #none
	private: false
	instanceVariableNames: 'previousSegment '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineSharedVariable: #Directions
	private: false
	constant: false
	category: 'accessing'
	initializer: 'Dictionary with: (0 @ -1) -> #north with: (0 @ 1) -> #south with: (-1 @ 0) -> #west with: (1 @ 0) -> #east'!


Smalltalk.Battlesnake defineSharedVariable: #HighPassingCost
	private: false
	constant: false
	category: 'accessing'
	initializer: '
	"
	High number representing non-passable content.
	"
	16rFFFFFFF'!


Smalltalk.Battlesnake defineSharedVariable: #RiskCost
	private: false
	constant: false
	category: 'accessing'
	initializer: '100'!


Smalltalk.Battlesnake defineSharedVariable: #StepCost
	private: false
	constant: false
	category: 'accessing'
	initializer: '100'!



!Battlesnake.TileContent class methodsFor: 'instance creation'!

on: aTile

	^ self new
		tile: aTile;
		yourself! !


!Battlesnake.TileContent methodsFor: 'accessing'!

snake

	^ nil!

neighbours

	^ tile neighbours!

y

	^ tile y!

tile: aTile

	tile := aTile!

tile

	^tile!

distanceTo: contentOrTile

	^ (contentOrTile position - self position) battlesnakeDistance!

position

	^ tile ifNotNil: [tile position]!

x

	^ tile x!

findPathTo: tileOrContent

	^ tile findPathTo: tileOrContent!

tilesWithinDistance: distance

	^ tile tilesWithinDistance: distance!

closestSnake

	^ tile closestSnake! !

!Battlesnake.TileContent methodsFor: 'accessing state'!

stateDescription

	^ self subclassResponsibility!

jsonState

	^ JSON encode: self state!

state

	^ Dictionary with: #state -> self stateDescription! !

!Battlesnake.TileContent methodsFor: 'testing'!

isSnakeBody

	^ false!

isSnakeHead

	^ false!

isWall

	^ false!

isSnakePart

	^ false!

isObstacle

	^ true!

isFood

	^ false!

isGold

	^ false! !

!Battlesnake.TileContent methodsFor: 'printing'!

printOn: aStream

	aStream nextPutAll: self jsonState! !


!Battlesnake.SnakePart methodsFor: 'accessing'!

nextSegment: anObject

	nextSegment := anObject!

nextSegment

	^nextSegment!

snake

	^snake!

snake: anObject

	snake := anObject!

tailLength
"
	The distance from here to the last segment of the Snake.
	This will change every time a segment is appended to the snake.
"

	| tailLength segment |
	tailLength := 0.
	segment := self.
	[(segment := segment nextSegment) isNil] whileFalse: [
		tailLength := tailLength + 1.
		].
	^ tailLength!

tile: aTile

	super tile: aTile.
	snake resetBubble!

previous

	^ nil! !

!Battlesnake.SnakePart methodsFor: 'accessing state'!

state

	^ super state
		at: #snake put: snake snakeName;
		yourself! !

!Battlesnake.SnakePart methodsFor: 'testing'!

isSnakePart

	^ true! !


!Battlesnake.Head methodsFor: 'accessing'!

tile: aTile

	super tile: aTile.
	snake lastPosition: aTile!

areaWithinDistance: distance

	^ tile areaWithinDistance: distance!

probabilityOfReaching: aTile in: numberOfMoves
"
	Answer an integer that is used as the percent probablity that I will reach aTile in numberOfMoves.
	This is only determined by the potential size of the area, not by presence of any content in the tiles,
"
	| distance area |
	
	distance := self distanceTo: aTile.
	distance > numberOfMoves ifTrue: [ ^0 ].
	
	area := self areaWithinDistance: distance.
	
	^ (10 * StepCost / area) rounded! !

!Battlesnake.Head methodsFor: 'accessing state'!

stateDescription

	^ 'head'! !

!Battlesnake.Head methodsFor: 'testing'!

isSnakeHead

	^ true! !


!Battlesnake.Game class methodsFor: 'encoding'!

jsonEncode: state

	^ Xtreams.JSON encode: state! !

!Battlesnake.Game class methodsFor: 'instance creation'!

fromState: state
"
"
	| width height |
	
	width := (state at: #width) asNumber.
	height := (state at: #height) asNumber.
	
	^ self new
		board: (Board width: width height: height);
		gameName: (state at: #game);
		breedMedusa;
		yourself! !


!Battlesnake.Game methodsFor: 'accessing'!

snakes

	^ board snakes!

board

	^board!

gameName

	^gameName!

board: aBoard

	board := aBoard.
	aBoard game: self.!

gameName: aString

	gameName := aString!

medusa

	^medusa!

turn: anObject

	turn := anObject!

foods

	^board foods!

turn

	^turn ifNil: [turn := 0]! !

!Battlesnake.Game methodsFor: 'accessing state'!

jsonState


		^ self class jsonEncode: self state!

state

	^ Dictionary new
		at: #game_id put: gameName;
		at: #turn put: turn;
		at: #board put: board state;
		at: #snakes put: (self snakes collect: #state);
		at: #food put: (self foods values collect: [ :eachFood | Array with: eachFood x with: eachFood y]);
		yourself!

updateState: aState
"
	aState will be a Dictionary with the following keys:
		game_id
		turn
		board
		snakes
		food
	Since the board information is redundant to the combination of 'snakes' and 'food', we will only concern ourselves with those.
"

	turn := aState at: #turn ifAbsent: [ self turn + 1].
	board updateState: aState.
	medusa := board medusa! !

!Battlesnake.Game methodsFor: 'printing'!

printOn: aStream

	aStream nextPutAll: self jsonState! !

!Battlesnake.Game methodsFor: 'actions'!

breedMedusa

	^ medusa := Medusa on: board.!

medusa: aMedusa

	medusa := aMedusa! !


!Battlesnake.BoardTile class methodsFor: 'instance creation'!

on: aBoard at: aPosition

	^ self new
		board: aBoard;
		position: aPosition;
		yourself! !


!Battlesnake.BoardTile methodsFor: 'accessing'!

x

	^ position x!

west

	^west!

snake

	^ content ifNotNil: [ content snake ]!

position

	^position!

probableCostIn: numberOfMoves for: aMedusa

	| cost |
	cost := 0.
	
	self board snakes do: [ :eachSnake |
		eachSnake == aMedusa ifFalse: [
			(eachSnake head distanceTo: self) < numberOfMoves ifTrue: [
				]
			].
		].
	
	cost!

board

	^board!

y

	^ position y!

east: aTile

	east == aTile ifTrue: [^self].
	east := aTile.
	aTile west: self!

east

	^east!

content
	
	^ content!

north

	^north!

north: aTile

	north == aTile ifTrue: [ ^ self ].
	north := aTile.
	aTile south: self!

cachedPathTo: aTile

	^ pathCache at: aTile ifAbsent: [nil]!

neighbourAt: offset

	offset = (-1 @ 0) ifTrue: [^ west].
	offset = (1 @ 0) ifTrue: [^ east].
	offset = (0 @ -1) ifTrue: [^ north].
	offset = (0 @ 1) ifTrue: [^ south].
	^ nil!

board: anObject

	board := anObject!

south

	^south!

south: aTile

	south == aTile ifTrue: [ ^ self ].
	south := aTile.
	aTile north: self!

tile
"
	For polymorphic use of certain methods, I implement tile to return self.
"
	^ self!

content: aTileContent

	content == aTileContent ifTrue: [ ^ self ].
	content ifNotNil: [
		content isFood ifTrue: [ board removeFood: content]
		].
	aTileContent ifNotNil: [ aTileContent tile: self ].
	(aTileContent notNil
		and: [content notNil
		and: [aTileContent isSnakePart
		and: [aTileContent snake == content snake ]]]) ifTrue: [ ^ self ].
	content := aTileContent.

	self announce: (TileStateChanged on: self)!

passingCostIn: numberOfMoves for: aMedusa

	self isTraversable ifTrue: [ ^ 0 ].	"Actually, this should be a probabilistic function of the distance of other snakes on board. "
	
	"content must be a SnakePart. Determine its tailLength, and whether it's shorter than numberOfMoves."
	
	^ (content tailLength < numberOfMoves)
		ifTrue: [ 0 ]
		ifFalse: [ HighPassingCost ]!

position: aPoint

	position := aPoint!

neighbours

	^ neighbours ifNil: [ neighbours := (Set new: 4)
		add: north;
		add: east;
		add: south;
		add: west;
		yourself]!

west: aTile

	west == aTile ifTrue: [ ^ self ].
	west := aTile.
	aTile east: self! !

!Battlesnake.BoardTile methodsFor: 'testing'!

isTraversable

	^ self isEmpty or: [content isObstacle not ]!

hasGold

	^ content notNil and: [ content isGold ]!

hasFood

	^ content notNil and: [ content isFood ]!

hasWall

	^ content notNil and: [ content isWall ]!

isEmpty

	^ content isNil!

isOccupiedBySnake

	^ content notNil and: [ content isSnakePart ]! !

!Battlesnake.BoardTile methodsFor: 'finding items'!

closestOf: items sortedBy: aBlock
"
	Answer the closest of the items where aBlock determines which distance we use.
"

	items isEmpty ifTrue: [ ^ nil ].
	
	^ (board sortItems: items by: aBlock) first!

closestGold

	^ self
		closestOf: board goldCoins
		sortedBy: [ :eachGold | self distanceTo: eachGold ]!

closestCorner

	^ self
		closestOf: board cornerTiles
		sortedBy: [ :eachTile | self distanceTo: eachTile ]!

farthestEdge

	| corner rectangle |
	corner := self farthestCorner.
	rectangle :=self position corner: corner position.
	
	^ rectangle width abs >= rectangle height abs
		ifTrue: [board at: corner x @ self y ]
		ifFalse: [board at: self x @ corner y ].!

closestSnake

	^ self
		closestOf: board snakes
		sortedBy: [ :eachSnake | self distanceTo: eachSnake ]!

farthestCorner

	^ self
		farthestOf: board cornerTiles
		sortedBy: [ :eachTile | self distanceTo: eachTile ]!

farthestOf: items sortedBy: aBlock
"
	Answer the farthest of the items where aBlock determines which distance we use.
"

	items isEmpty ifTrue: [ ^ nil ].
	
	^ (board sortItems: items by: aBlock) last!

closestCornerByPath

	^ self
		closestOf: board cornerTiles
		sortedBy: [ :eachTile | self pathDistanceTo: eachTile ]!

closestSnakeByPath

	^ self
		closestOf: board snakes
		sortedBy: [ :eachSnake | self pathDistanceTo: eachSnake ]!

closestFood

	^ self
		closestOf: board foods
		sortedBy: [ :eachFood | self distanceTo: eachFood ]!

closestEdge

	| corner rectangle |
	corner := self closestCorner.
	rectangle :=self position corner: corner position.
	
	^ rectangle width abs >= rectangle height abs
		ifTrue: [board at: self x @ corner y ]
		ifFalse: [board at: corner x @ self y ].!

farthestEdgeTile

	| corner rectangle |
	corner := self farthestCorner.
	rectangle :=self position corner: corner position.
	
	^ rectangle width abs < rectangle height abs
		ifTrue: [board at: self x @ corner y ]
		ifFalse: [board at: corner x @ self y ].!

closestFoodByPath

	^ self
		closestOf: board foods
		sortedBy: [ :eachFood | self pathDistanceTo: eachFood ]! !

!Battlesnake.BoardTile methodsFor: 'path finding'!

resetCachedPath: announcement

	pathCache removeKey: announcement tile ifAbsent: []!

simplePathTo: targetTile
"
	Find which of the x,y deltas is larger, and add nodes along that axis before adding nodes along the other axis.
"

	| path rectangle long short current corner |
	
	path := OrderedCollection new: (self distanceTo: targetTile) + 1.
	rectangle := self position corner: targetTile position.

	rectangle width abs >= rectangle height abs
		ifTrue: [
			long := rectangle width @ 0.
			short := 0 @ rectangle height ]
		ifFalse: [
			short := rectangle width @ 0.
			long := 0 @ rectangle height ].

	corner := self position + long.
	long := long x sign @ long y sign.
	short := short x sign @ short y sign.
	current := self.

	(Array with: corner -> long with: targetTile position -> short) do: [ :cornerOffset |
		| nextCorner offset |
		nextCorner := cornerOffset key.
		offset := cornerOffset value.
		[ current position = nextCorner ] whileFalse: [
			current := current neighbourAt: offset.
			path add: current]
		].

	^path!

findPathTo: tileOrContent

	| targetTile |
	
	targetTile := tileOrContent tile.
	
	pathCache at: targetTile ifPresent: [:cachedPath | ^ cachedPath ].
	
	^ (PathNode on: self target: targetTile) findPathToTarget!

cachePath: newPath to: targetTile

	pathCache at: targetTile ifPresent: [ :oldPath |
		oldPath do: [ :eachTile | eachTile retractInterestIn: TileStateChanged for: self ]
		].
	
	newPath do: [:eachTile |
		eachTile when: TileStateChanged send: #resetCachedPath: to: self
		].
	
	pathCache at: targetTile put: newPath.
	
	^ newPath! !

!Battlesnake.BoardTile methodsFor: 'initialize-release'!

resetContent

	content := nil!

initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	pathCache := IdentityDictionary new.
	^self! !

!Battlesnake.BoardTile methodsFor: 'measuring'!

areaWithinDistance: distance
"
	Answer the number of tiles possible occupied within distance.
	The number of unique tiles that has a NY distance given by distance.
	Examples:
		BoardTile new areaWithinDistance: 1.
		BoardTile new areaWithinDistance: 2.
		BoardTile new areaWithinDistance: 3.
		BoardTile new areaWithinDistance: 10.
"

	^ 2 * distance * (distance + 1)!

distanceTo: contentOrTile

	^ (contentOrTile position - self position) battlesnakeDistance!

pathDistanceTo: contentOrTile

	^ self pathDistanceTo: content using: [self findPathTo: contentOrTile]!

pathDistanceTo: aTileOrContent using: aBlock

	^ (aBlock value: aTileOrContent) ifNotNil: [: path | path size ]!

tilesWithinDistance: distance
"
"

	| xMin xMax yMin yMax tiles  |
	
	tiles := Set new: (self areaWithinDistance: distance).
	
	xMin := (position x - distance) max: 0.
	xMax := (position x + distance) min: board width - 1.
	yMin := (position y - distance) max: 0.
	yMax := (position y + distance) min: board height - 1.
	
	xMin to: xMax do: [ :x |
		| yFrom yTo xOffset |
		xOffset := x - position x.
		yFrom := position y - distance + xOffset abs.
		yTo := position y + distance - xOffset abs.
		yFrom := yFrom max: yMin.
		yTo := yTo min: yMax.
		yFrom to: yTo do: [ :y |
			tiles add: (board at: (x @ y))
			]
		].
	
	^ tiles! !

!Battlesnake.BoardTile methodsFor: 'printing'!

printOn: aStream

	aStream nextPutAll: self jsonState! !

!Battlesnake.BoardTile methodsFor: 'converting'!

asDictionary

	| dict |
	dict := Dictionary new.
	dict at: #state put: self state.
	self snake ifNotNil: [ dict at: #snake put: self snake snakeName ].
	
	^ dict! !

!Battlesnake.BoardTile methodsFor: 'accessing state'!

jsonState

	^ Game jsonEncode: self state!

state

	| state |
	
	state := Dictionary with: (#xy -> (Array with: self x with: self y)).
	
	content
		ifNil: [ state add: #state -> 'empty']
		ifNotNil: [ state addAll: content state ].
	
	^ state! !


!Battlesnake.WormHole class methodsFor: 'html'!

headJQueryCss
	<head: 50>

	^'
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/humanity/jquery-ui.css" />
'!

headExternalLibraries
	<head: 200>

	^'
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
'!

bodyTester

	<body: 100>
	
	^ '
<p>
	<a href="https://github.com/JerryKott/battlesnake">Medusa</a>
</p>
<p>
	<a href="/start?data=start%20the%20game">Send a <b>START</b> request.</a><br>
	<a href="/move?data=send%20us%20your%20board">Send a <b>MOVE</b> request.</a><br>
	<a href="/end?data=stop%20the%20game">Send an <b>END</b> request.</a><br>
</p>
'! !

!Battlesnake.WormHole class methodsFor: 'configuration'!

serverConfiguration
"
	Add myself to the Battlesnake Server.
	http://localhost:8889/
"
	<position: 10>
	<server: 'Battlesnake Server' path: '/'>! !

!Battlesnake.WormHole class methodsFor: 'accessing'!

activeGame

	^ activeGame!

activeGame: aGame

	activeGame := aGame!

applicationClientClass
	
	^ WormHoleClient! !

!Battlesnake.WormHole class methodsFor: 'appex overrides'!

appexCoreCode
"
	This method has been added to get access to AppeX.CoreCode.js in tester subdirectory.
"

	<js: 'tester/AppeX.CoreCode.js'>
	
	^ AppeX.CoreCode javascriptLibrary!

appexWormHoleClient
"
	This method has been added to get access to WormHoleClient.js in tester subdirectory.
"
	<js: 'tester/Battlesnake.WormHoleClient.js'>
	
	^ self applicationClientClass javascriptLibrary! !

!Battlesnake.WormHole class methodsFor: 'testing API'!

testPage
"
"

	<html: 'tester'>
	
	^ super htmlDocument!

testingJs

	<js: 'tester/default.js'>
	
	^ '
	testRequest = function testRequest(data, url) {
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			data: data,
			success: testSuccess
		})
	};
	
	testSuccess = function testSuccess(result, status, xhr){
		console.log(result);
	};

	testFailed = function testFailed(xhr,status,error){
		console.log(xhr,status,error);
	};
'! !

!Battlesnake.WormHole class methodsFor: 'battlesnake API'!

htmlDocument
"
	Battlesnake rules specify that GET / returns a string with a link to our source code repository.
"
	<GET>
	<json: ''>

	^ Dictionary with: #color -> '#00ff00' with: #head -> 'https://github.com/JerryKott/battlesnake'!

move
"
"

	<json: 'move'>
	<GET>
	<POST>
	
	| state game medusa |
	state := self decodeFormDataRequest.

	game := self activeGame.
	
	game updateState: state.
	medusa := game medusa.
	medusa behave.
	
	^ medusa moveResponseState!

resetGame
"
"

	<json: 'reset'>
	<GET>
	<POST>

	activeGame := nil.
	
	^ 'Game reset!!'!

start
"
"
	<json: 'start'>
	<POST>

	| state game response |
	self resetGame.
	state := self decodeFormDataRequest.
	game := Game fromState: state.
	self activeGame: game.
"	game inspect.
"	

	response := activeGame medusa startResponseState.
"	response inspect.
"	^ response!

end
"
"

	<json: 'end'>
	<GET>
	<POST>
	
	
	| response |
	
	response := Dictionary new.
	
	self activeGame isNil ifTrue: [
		^ response
			at: #status put: 'No game in progress';
			yourself
		].

	self activeGame: nil.
	
		
	^ response! !

!Battlesnake.WormHole class methodsFor: 'encoding - decoding'!

decodeJsonRequest

	| data formData uri query |
	formData := self currentRequestData.
	query := formData data first key.
	uri := URI fromEncodedString: '/?', query.
	data := Dictionary new.
	uri queryKeysAndValuesDo: [ :key :value |
		| valueString |
		valueString := URLEncoder decode: value.
		data at: key asSymbol put: valueString
		].
	
	^ data!

encodeJsonData: data
"
	This is a placeholder in case we need to change our implementation depending on the XHR contentType.
"
	^ JSON encode: data!

encodeFormData: data

	^ JSON encode: data!

decodeFormDataRequest

	| data formData |
	formData := self currentRequestData.
	data := JSON decode: formData data first key.
	
	^ data! !


!Battlesnake.PathNode class methodsFor: 'instance creation'!

on: aTile target: targetTile parentNode: aNodeOrNil

	^ self new
		tile: aTile;
		target: targetTile;
		parentNode: aNodeOrNil;
		yourself!

new

	^ super new initialize!

on: aTile target: targetTile

	^ self on: aTile target: targetTile parentNode: nil! !


!Battlesnake.PathNode methodsFor: 'accessing'!

distanceFromStart
"
	Once a Node has a parentNode, it's distanceFromStart needs to be calculated only once.
"
	^ distanceFromStart ifNil: [
		| currentNode |	
		distanceFromStart := 0.
		currentNode := self.
		[
			currentNode := currentNode parentNode.
			currentNode notNil
		] whileTrue: [
			distanceFromStart := distanceFromStart + 1.
			].
		distanceFromStart ]!

stepCost
"
	Answer how much it costs us to make a step. Let's use 100 because it's such a nice round number.
"

	^ 100!

target: aTile

	target := aTile.
	self updateCostToTarget!

costOfTravel

	^ costOfTravel ifNil: [ self updateCostOfTravel ]!

parentNode: aPathNode

	parentNode == aPathNode ifTrue: [ ^ self ].
	parentNode := aPathNode.
	distanceFromStart := nil.
	self updateCostFromStart!

position

	^ tile position!

costToTarget

	^costToTarget ifNil: [ self updateCostToTarget ]!

tile: anObject

	tile := anObject!

distanceTo: anotherNode

	| offset |
	
	offset := (anotherNode position - self position) abs.
	"We can only make rectangular moves. If we were able to move diagonally, we'd have to use pythagorean theorem to calculate
	the diagonal distances."
	^ offset x + offset y!

costFromStart
"
	If it hasn't been calculated yet, determine gCost as the product of my distance from the start of the path
	(the first node in the linked list) and a cost associated with a single step.
"
	^costFromStart ifNil: [ self updateCostFromStart ]!

distanceToTarget

	^ tile distanceTo: target!

parentNode

	^parentNode!

target

	^target!

tile

	^tile!

costOfRisk

	^costOfRisk ifNil: [self updateCostOfRisk ]! !

!Battlesnake.PathNode methodsFor: 'printing'!

printOn: aStream

	super printOn: aStream.
	aStream nextPut: $(.
	self position printOn: aStream.
	aStream nextPut: $).! !

!Battlesnake.PathNode methodsFor: 'actions'!

updateCostFromStart
"
	If it hasn't been calculated yet, determine gCost as the product of my distance from the start of the path
	(the first node in the linked list) and a cost associated with a single step.
"
	^ costFromStart := self distanceFromStart * StepCost!

updateCostOfTravel

	^ costOfTravel := self costFromStart + self costToTarget + self costOfRisk!

updateCostOfRisk
"
	costOfRisk is the probable cost of passing through the tile in N moves.
	It is determined by the number of empty neighbours of the tile.
	The smaller the number, the higher the risk will be.
	It is also determined by the distance of snakes from the tile.
	The closer a snake is, the higher the risk will be.
"

	| emptyNeighbours |
	
	emptyNeighbours := tile neighbours select: #isEmpty.
	
	costOfRisk := (4 - emptyNeighbours size) * RiskCost.
	
	tile board snakes do: [ :eachSnake |
		eachSnake isEnemy ifTrue: [
			costOfRisk := costOfRisk + (eachSnake head probabilityOfReaching: tile in: self distanceFromStart)
			]
		].
	
	^ costOfRisk!

updateCosts

	^ self
		updateCostFromStart;
		updateCostToTarget;
		updateCostOfRisk;
		updateCostOfTravel!

updateCostToTarget

	^ costToTarget := self distanceToTarget * StepCost! !

!Battlesnake.PathNode methodsFor: 'path finding'!

findPathToTarget
"
	A modified version of the A* algorithm.
"

	| remainingNodes visitedNodes nodesByTiles |
	
	(tile cachedPathTo: target) ifNotNil: [:cachedPath | ^cachedPath].
	
	remainingNodes := SortedCollection sortBlock: [:a :b | a costOfTravel <= b costOfTravel].
	visitedNodes := IdentitySet new.
	nodesByTiles := IdentityDictionary new.

	nodesByTiles at: tile put: self.
	remainingNodes add: self.

	[remainingNodes isEmpty] whileFalse: [
			| currentNode currentNeighbours knownPath |
			currentNode := remainingNodes removeFirst.
			visitedNodes add: currentNode.
			
			knownPath := currentNode tile cachedPathTo: target.
			(knownPath notNil or: [currentNode tile == target]) ifTrue: [
				^self backtrackPath: currentNode knownPath: knownPath].
				
			currentNeighbours := currentNode tile neighbours sorted: [:a :b |
				(a distanceTo: target) <= (b distanceTo: target)].
						
			currentNeighbours do: [:eachTile |
					| node processNode |
					node := nodesByTiles
						at: eachTile
						ifAbsentPut: [PathNode on: eachTile target: target parentNode: currentNode].
						
					processNode := (visitedNodes includes: node) not.
					(eachTile isTraversable not and: [processNode]) ifTrue: [
							visitedNodes add: node.
							processNode := false].
						
					processNode ifTrue: [
							| oldCost newCost nodeInOpen |
							oldCost := node costFromStart.
							node updateCosts.
							nodeInOpen := remainingNodes includes: node.
							nodeInOpen ifTrue: [remainingNodes reSort].
							newCost := node costFromStart.
							(newCost < oldCost or: [nodeInOpen not]) ifTrue: [
								node parentNode: currentNode.
								nodeInOpen ifFalse: [remainingNodes add: node]]]]].

	"If I got here there is no path to targetTile. Return nil."

	self halt.
	^nil!

backtrackPath: endNode knownPath: knownPath

	| path backTrack |
	backTrack := endNode.
	path := OrderedCollection new.
	knownPath ifNotNil: [path addAll: knownPath reverse].
	[backTrack notNil] whileTrue: 
			[path add: backTrack.
			backTrack := backTrack parentNode].
	path := (path reverse collect: #tile)
				removeFirst;
				yourself.	"That's me!!"
	^tile cachePath: path to: target! !

!Battlesnake.PathNode methodsFor: 'initialize-release'!

initialize

	super initialize.
	
	costFromStart := costToTarget := 0.! !


!Battlesnake.Snake class methodsFor: 'instance creation'!

on: aBoard

	^ self new
		board: aBoard;
		yourself!

new

	^ super new initialize! !


!Battlesnake.Snake methodsFor: 'accessing'!

tilesWithinDistance: distance

	^ head tilesWithinDistance: distance!

occupiedTiles
"
	Answer a collection of tiles that my body occupies.
"

	^ self segments collect: #tile!

closestFood

	^ head tile closestFood!

lastPosition: aTile

	lastPosition := aTile!

head: aHead

	head := aHead.
	aHead snake: self.
	segments := OrderedCollection with: head.!

power

	^ self segments size!

findPathTo: tileOrContent

	^ head findPathTo: tileOrContent!

position

	^ head position!

newHead

	^Head new!

snakeName

	^snakeName!

tail

	^ head
		ifNil: [ nil ]
		ifNotNil: [ self segments last ]!

closestGold

	^ head tile closestGold!

board

	^board!

distanceTo: contentOrTile

	^ (contentOrTile position - self position) battlesnakeDistance!

closestSnake

	^ head tile closestSnake!

lastPosition

	^lastPosition!

board: aBoard

	board := aBoard!

segments

	| answer part |
	part := head.
	answer := OrderedCollection new.
	[ part notNil ] whileTrue: [
		answer add: part.
		part := part nextSegment.
		].

	^answer!

head

	^head!

appendBody: aBody

	| part |
	part := segments last.
	part nextSegment: aBody.
	aBody previousSegment: part.
	aBody snake: self.
	segments add: aBody.!

newBody

	^Body new!

snakeName: anObject

	snakeName := anObject!

tile
"
	To ensure polymorphic calculations, we define the tile of a Snake as the tile occupied by its Head.
"

	^ head tile!

ensurePartAt: index

	| part count |
	segments size >= index ifTrue: [^segments at: index].
	index = 1
		ifTrue: 
			[head ifNil: [self head: self newHead].
			part := head]
		ifFalse: 
			[count := 1.
			part := head.
			[count < index] whileTrue: 
					[part nextSegment ifNil: [self appendBody: self newBody].
					part := part nextSegment.
					count := count + 1]].
	^part! !

!Battlesnake.Snake methodsFor: 'testing'!

shouldRunFrom: anotherSnake

	^ (self canHunt: anotherSnake) not!

isMedusa

	^ false!

isEnemy

	^ true!

canHunt: anotherSnake

	^ self power > anotherSnake power! !

!Battlesnake.Snake methodsFor: 'actions'!

resetBubble
"
	Ordinary snakes don't have bubble, do nothing.
"!

updateSegmentsFrom: points
"
"

	| length |
	length := points size.
	1 to: length do: [ :index |
		| part newTile |
		part := self ensurePartAt: index.
		part tile ifNotNil: [: oldTile | oldTile resetContent].
		newTile := board at: (points at: index).
		newTile content: part]! !

!Battlesnake.Snake methodsFor: 'initialize-release'!

initialize

	super initialize.
	segments := OrderedCollection new.
	liveStatus := 'alive'.
	kills := 0.
	color := "Graphics.ColorValue red" '#ff0000'.! !

!Battlesnake.Snake methodsFor: 'printing'!

printOn: aStream

	aStream nextPutAll: self jsonState! !

!Battlesnake.Snake methodsFor: 'accessing state'!

updateState: aState
"	
"


	self updateCoordinates: (aState at: #coords ifAbsent: [ #()]).
	kills := (aState at: #kills ifAbsent: [ 0 ]).
	liveStatus := (aState at: #status ifAbsent: [ 'alive']).
	health := (aState at: #health ifAbsent: [ 100 ]).!

updateCoordinates: anArray
"
	anArray will contain #(x, y) arrays representing the tile on which
	individual snake segments lie.
"

	self updateSegmentsFrom: (anArray collect: [ :each | each first @ each last])!

jsonState

	^ Game jsonEncode: self state!

state

	^ Dictionary new
		at: #name put: self snakeName;
		at: #status put: liveStatus;
		at: #coords put: (self segments collect: [:each | Array with: each x with: each y]);
		at: #kill put: kills;
		at: #color put: color;
		at: #head_url put: headUrl;
		at: #taunt put: Medusa randomTaunt;
		at: #health put: health;
		yourself!

taunt
"
	Answer a taunt. This still needs to be implemented.
"

	^'Taunts need to be implemented'! !


!Battlesnake.Medusa class methodsFor: 'accessing'!

defaultSnakeName

	^ 'Medusa'!

taunts
"
	Answer a collection of Strings to be used as taunts during the game.
	(self taunts)
"

	^ #(
		'We will we will STONE you!!'
		'My snake is smarter than your snake.'
		'If I win, you buy beer!!'
		)!

snakeId

	^ '98d61455-ff9d-41d8-b394-960336ef9da3'!

randomTaunt
"
	Answer a collection of Strings to be used as taunts during the game.
	(self randomTaunt)
"

	tauntSelector := tauntSelector ifNil: [Random new].
	
	^ self taunts at: (tauntSelector next * self taunts size) ceiling! !

!Battlesnake.Medusa class methodsFor: 'instance creation'!

on: aBoard

	|myMedusa|
	myMedusa := super on: aBoard.
	aBoard medusa: myMedusa.
	^myMedusa! !


!Battlesnake.Medusa methodsFor: 'accessing'!

bubble

	^ bubble ifNil: [ bubble := self tilesWithinDistance: self bubbleSize]!

currentBehavior

	^currentBehavior ifNil: [ self nextBehavior ]!

target: anObject

	target := anObject!

behaviors

	behaviors isEmpty ifTrue: [ self setDefaultBehavior ].

	^behaviors!

closestEdge

	^ head tile closestEdge!

path

	^ (path isNil or: [ path isEmpty ])
		ifTrue: [ path := self findPathToTarget ]
		ifFalse: [ path ]!

findPathTo: tileOrContent

	path ifNotNil: [ path do: [ :eachTile | self loseInterestInTile: eachTile ]].
	^ super findPathTo: tileOrContent!

path: tiles
"
	Set my path to a collection of Tiles
"
	path := tiles!

setDefaultBehavior
"
	Here is where we determine what out next strategy should be. Until that is finalized,
	let's just set the 'find food' strategy is default.
"

	self addBehavior: #findFood!

findPathToTarget
	"
	Find the best path to my current target.
"

	^ (self findPathTo: self target) ifNotNil: [ :newPath |
		newPath do: [:eachTile | self becomeInterestedInTile: eachTile].
		newPath ]!

farthestEdge

	^ head tile farthestEdge!

findTarget
"
	Return a Tile or Food (possibly another Snake Head?) based on the current strategy.
	For now, just return my tail's neighbor that is not a snake part.
"

	^ self tail neighbours detect: [ :any | any isEmpty ]!

board: aBoard

	board == aBoard ifTrue: [^self].
	board retractInterestIn: BoardStateChanged for: self.
	super board: aBoard.
	board when: BoardStateChanged send: #boardStateChanged: to: self.!

bubbleSize
"
	I am a Medusa. My bubble size is 3 moves ahead.
"
	^ 3!

nextMove
	
	^ nextMove!

bubbleShift
"
	Answer a point that should be the direction of the bubble's shift.
	All empty tiles have the weight equal to distance from the head.
	Tiles with food have larger weight the closer they are to the head.
"

	| sumX sumY sumWeight dX dY shift |
	
	sumX := sumY := sumWeight := 0.
	
	self bubble do: [ :eachTile |
		| eachWeight |
		eachWeight := 0.
		eachTile isEmpty
			ifTrue: [
"				eachWeight := self distanceTo: eachTile.
"
				eachWeight := 1.
				]
			ifFalse: [
				eachWeight := self bubbleSize + 1 - (self distanceTo: eachTile).
			].
		eachTile isTraversable ifFalse: [
			eachWeight := eachWeight negated.
			].
		sumX := sumX + (eachTile x * eachWeight).
		sumY := sumY + (eachTile y * eachWeight).
		sumWeight := sumWeight + eachWeight.
		].
	
	dX := (sumX / sumWeight) - head x.
	dY := (sumY / sumWeight) - head y.
	
	shift := dX abs > dY abs
		ifTrue: [ dX sign @ 0 ]
		ifFalse: [ 0 @ dY sign ].
		
	
	^ shift!

target

	^target ifNil: [target := self findTarget]! !

!Battlesnake.Medusa methodsFor: 'testing'!

isMedusa

	^ true!

isEnemy

	^ false! !

!Battlesnake.Medusa methodsFor: 'actions'!

findEnemiesInBubble
"
	Go through my bubble and for each tile that have a snake part in them that is not me, add that snake to the result.
"

	| enemies |
	
	enemies := Set new.
	 self bubble do: [ :eachTile | eachTile snake
		ifNotNil: [ :snake | snake ~~ self ifTrue: [ enemies add: snake ]]
		].
	
	^ enemies!

resetTarget

	target := nil!

findFoodsInBubble

	| foods |
	
	foods := Set new.
	 self bubble do: [ :eachTile | eachTile hasFood ifTrue: [ foods add: eachTile content ]
		].
	
	^ foods!

becomeInterestedInTile: aTile

	^aTile when: TileStateChanged send: #tileStateChanged: to: self!

loseInterestInTile: eachTile

	^eachTile retractInterestIn: TileStateChanged for: self!

resetPath

	path ifNotNil: [path do: [:eachTile | self loseInterestInTile: eachTile]].
	path := nil!

resetBubble

	bubble := nil!

doMove
"
	Take the nextMove and move the head there. Then move the rest of the body.
"

	| nextTile currentTile currentSegment |
	
	nextTile := board at: (self position + nextMove).
	currentSegment := head.
	
	[currentSegment isNil] whileFalse: [
		currentTile := currentSegment tile.
		nextTile content: currentSegment.
		currentSegment := currentSegment nextSegment.
		nextTile := currentTile.
		]! !

!Battlesnake.Medusa methodsFor: 'strategies'!

nextMoveDirection

	^ Directions at: self nextMove ifAbsent: [ Directions any ]!

findGoldIAmClosestTo

	| coins |
	coins := board goldCoins sorted: [ :a :b |( a distanceTo: self) <= (b distanceTo: self) ].
	^ coins detect: [ :anyCoin | (anyCoin position ~= self position) and: [anyCoin closestSnake == self] ] ifNone: [ nil ]!

findFoodIAmClosestTo

	| foods |
	foods := board foods sorted: [ :a :b |( a distanceTo: self) <= (b distanceTo: self) ].
	^ foods detect: [ :anyFood | (anyFood position ~= self position) and: [anyFood closestSnake == self] ] ifNone: [ nil ]!

moveTo: aTile

	^ nextMove := aTile position - self position!

escapeSnakes
"
	This strategy method will implement the snake escaping algorithm.
"!

findGoldClosestToMe

	^ board goldCoins detect: [ :anyGold | self closestGold == anyGold ] ifNone: [ nil ]!

moveAlong

	^ [ self doMoveAlong ]!

goToPerimeter

	^ [ self doGoToPerimeter ]!

pushBehavior: aSymbol

	behaviors addFirst: aSymbol!

findFood

	^ [ self doFindFood ]!

huntSnakes
"
	This strategy method will implement the snake hunting algorithm.
"!

findFoodClosestToMe

	^ board foods detect: [ :anyFood | self closestFood == anyFood ] ifNone: [ nil ]! !

!Battlesnake.Medusa methodsFor: 'initialize-release'!

initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	headUrl := 'http://blog.novydomov.ca/wp-content/uploads/2008/08/MedusaHead20-copy.png'.
	snakeName := 'Medusa'.
	self initializeBehaviors!

initializeBehaviors

	behaviors := (OrderedCollection new)
"				add: #findFood;
				add: #moveAlong;
				add: #findFood;
				add: #moveAlong;"
				yourself! !

!Battlesnake.Medusa methodsFor: 'behaviors'!

doFindFood
"
	Return the next move when finding food
"

	| food |
	
	food := self findFoodIAmClosestTo ifNil: [ self findFoodClosestToMe].
	
	path := food
		ifNil: [ self doGoToPerimeter.
			^ nextMove ]
		ifNotNil: [ self findPathTo: food ].
		
	^ self moveTo: path removeFirst.!

doMoveAlong

	| tile |
	tile := self path removeFirst.
	self loseInterestInTile: tile.
	tile == self target tile ifTrue: [
		self resetPath; resetTarget.
		self nextBehavior
		].
	^ nextMove := tile position - head position!

doGoToPerimeter
"
	This strategy method is a placeholder to go the board perimeter.
"

	| edge |
	
	 edge := self farthestEdge.
	
	path := edge
		ifNil: [ self findPathTo: self tile neighbours any "Any move will do?" ]
		ifNotNil: [ self findPathTo: edge ].
		
	path isEmpty ifTrue: [
		^ self doFindFood.
		].
	
	^ self moveTo: path removeFirst.!

doFindGold
"
	Return the next move when finding food
"

	| gold |
	
	gold := self findGoldIAmClosestTo ifNil: [ self findGoldClosestToMe].
	
	path := gold
		ifNil: [ self doGoToPerimeter.
			^ nextMove ]
		ifNotNil: [ self findPathTo: gold ].
	
	path isEmpty ifTrue: [
		^ self doGoToPerimeter].
		
	^ self moveTo: path removeFirst.!

behave

	"^ (self perform: self currentBehavior) value"
	
	
	self board goldCoins notEmpty ifTrue: [
		^ self doFindGold].

	path
		ifNotNil: [
			path notEmpty ifTrue: [
				^ self moveTo: path removeFirst ]].

	self board game turn < 10 ifTrue: [
		^ self doFindFood ].	
	
	self health < 50 ifTrue: [
		^ self doFindFood].
	
	
	"the last resort"
	self doGoToPerimeter!

insertBehavior: aSymbol before: anotherSymbol

	^ behaviors add: aSymbol before: anotherSymbol!

resetBehaviors

	behaviors := OrderedCollection new.!

nextBehavior
"
	ANswer a block which, when evaluated, will run the behaviour to plan moves.
"
	^ currentBehavior := self behaviors removeFirst!

addBehavior: aSymbol

	behaviors add: aSymbol!

planBehavior
"

"
	^ (self perform: self nextBehavior) value!

delayBehavior: aSymbol

	behaviors addLast: aSymbol! !

!Battlesnake.Medusa methodsFor: 'accessing state'!

startResponseState
"
	From https://github.com/sendwithus/battlesnake-legacy#response 
"
	^ self stateKeys: #(#name #color #head_url #taunt)!

moveResponseState
"
	from https://github.com/sendwithus/battlesnake-legacy#response-1 :

	{
	  'move': 'up',
	  'taunt': 'go snake yourself'
	}
"

	^ self stateKeys: #(#move #taunt)!

state

	^ super state
		at: #move put: self nextMoveDirection;
		yourself!

stateKeys: aCollection

	| state newState |

	state := self state.	
	newState := aCollection collect: [ :each | state associationAt: each ifAbsent: [nil]].
	
	^ Dictionary withAll: newState! !

!Battlesnake.Medusa methodsFor: 'notifications'!

health

	^ health ifNil: [ 100 ]!

boardStateChanged: anAnnouncement

	
	
	head ifNil: [ ^ self ].
	anAnnouncement tile hasFood
		ifTrue:  [
			health > 70 ifTrue: [ ^self].
			"oldPath:= path."
			self doFindFood. 
			].
	anAnnouncement tile hasGold
		ifTrue:[self doFindGold.
			]
			"((oldPath notNil and: [path size < oldPath size]) or:[currentBehavior = #findFood])
				ifTrue: 
					[currentBehavior := #moveAlong.]
				
				ifFalse: [
					oldPath notNil 
						ifTrue:[path := oldPath.]
					path isNil ifTrue: [path := newPath.]]]"!

tileStateChanged: anAnnouncement! !


!Battlesnake.WormHoleClient methodsFor: 'test data'!

exampleGameData() {
	return {"game_id": "Example Game", "snakes": {"Enemy 1": {"head_url": "http://head.some-snake.example/head.png", "taunt": "Taunts need to be implemented", "color": "#ff0000", "coords": [[10, 12], [10, 13], [10, 14], [10, 15]], "score": 0, "state": "alive", "name": "Enemy 1"}, "Medusa": {"head_url": "http://head.some-snake.example/head.png", "taunt": "Taunts need to be implemented", "color": "#ff0000", "coords": [[7, 8], [6, 8], [5, 8], [5, 9], [5, 10], [4, 10]], "score": 0, "state": "alive", "name": "Medusa"}, "Enemy 2": {"head_url": "http://head.some-snake.example/head.png", "taunt": "Taunts need to be implemented", "color": "#ff0000", "coords": [[11, 5], [11, 4], [10, 4], [10, 3], [10, 2], [11, 2], [12, 2], [13, 2]], "score": 0, "state": "alive", "name": "Enemy 2"}}, "turn": 0, "board": [[{"xy": [0, 0], "state": "empty"}, {"xy": [1, 0], "state": "empty"}, {"xy": [2, 0], "state": "empty"}, {"xy": [3, 0], "state": "empty"}, {"xy": [4, 0], "state": "empty"}, {"xy": [5, 0], "state": "empty"}, {"xy": [6, 0], "state": "empty"}, {"xy": [7, 0], "state": "empty"}, {"xy": [8, 0], "state": "empty"}, {"xy": [9, 0], "state": "empty"}, {"xy": [10, 0], "state": "empty"}, {"xy": [11, 0], "state": "empty"}, {"xy": [12, 0], "state": "empty"}, {"xy": [13, 0], "state": "empty"}, {"xy": [14, 0], "state": "empty"}, {"xy": [15, 0], "state": "empty"}, {"xy": [16, 0], "state": "empty"}, {"xy": [17, 0], "state": "empty"}, {"xy": [18, 0], "state": "empty"}, {"xy": [19, 0], "state": "empty"}], [{"xy": [0, 1], "state": "empty"}, {"xy": [1, 1], "state": "empty"}, {"xy": [2, 1], "state": "empty"}, {"xy": [3, 1], "state": "empty"}, {"xy": [4, 1], "state": "empty"}, {"xy": [5, 1], "state": "empty"}, {"xy": [6, 1], "state": "empty"}, {"xy": [7, 1], "state": "empty"}, {"xy": [8, 1], "state": "empty"}, {"xy": [9, 1], "state": "empty"}, {"xy": [10, 1], "state": "empty"}, {"xy": [11, 1], "state": "empty"}, {"xy": [12, 1], "state": "empty"}, {"xy": [13, 1], "state": "empty"}, {"xy": [14, 1], "state": "empty"}, {"xy": [15, 1], "state": "empty"}, {"xy": [16, 1], "state": "empty"}, {"xy": [17, 1], "state": "empty"}, {"xy": [18, 1], "state": "empty"}, {"xy": [19, 1], "state": "empty"}], [{"xy": [0, 2], "state": "empty"}, {"xy": [1, 2], "state": "empty"}, {"xy": [2, 2], "state": "food"}, {"xy": [3, 2], "state": "empty"}, {"xy": [4, 2], "state": "empty"}, {"xy": [5, 2], "state": "empty"}, {"xy": [6, 2], "state": "empty"}, {"xy": [7, 2], "state": "empty"}, {"xy": [8, 2], "state": "empty"}, {"xy": [9, 2], "state": "empty"}, {"state": "body", "xy": [10, 2], "snake": "Enemy 2"}, {"state": "body", "xy": [11, 2], "snake": "Enemy 2"}, {"state": "body", "xy": [12, 2], "snake": "Enemy 2"}, {"state": "body", "xy": [13, 2], "snake": "Enemy 2"}, {"xy": [14, 2], "state": "empty"}, {"xy": [15, 2], "state": "empty"}, {"xy": [16, 2], "state": "empty"}, {"xy": [17, 2], "state": "empty"}, {"xy": [18, 2], "state": "empty"}, {"xy": [19, 2], "state": "empty"}], [{"xy": [0, 3], "state": "empty"}, {"xy": [1, 3], "state": "empty"}, {"xy": [2, 3], "state": "empty"}, {"xy": [3, 3], "state": "empty"}, {"xy": [4, 3], "state": "empty"}, {"xy": [5, 3], "state": "empty"}, {"xy": [6, 3], "state": "empty"}, {"xy": [7, 3], "state": "empty"}, {"xy": [8, 3], "state": "empty"}, {"xy": [9, 3], "state": "empty"}, {"state": "body", "xy": [10, 3], "snake": "Enemy 2"}, {"xy": [11, 3], "state": "empty"}, {"xy": [12, 3], "state": "empty"}, {"xy": [13, 3], "state": "empty"}, {"xy": [14, 3], "state": "empty"}, {"xy": [15, 3], "state": "empty"}, {"xy": [16, 3], "state": "empty"}, {"xy": [17, 3], "state": "empty"}, {"xy": [18, 3], "state": "empty"}, {"xy": [19, 3], "state": "empty"}], [{"xy": [0, 4], "state": "empty"}, {"xy": [1, 4], "state": "empty"}, {"xy": [2, 4], "state": "empty"}, {"xy": [3, 4], "state": "empty"}, {"xy": [4, 4], "state": "empty"}, {"xy": [5, 4], "state": "empty"}, {"xy": [6, 4], "state": "empty"}, {"xy": [7, 4], "state": "empty"}, {"xy": [8, 4], "state": "empty"}, {"xy": [9, 4], "state": "empty"}, {"state": "body", "xy": [10, 4], "snake": "Enemy 2"}, {"state": "body", "xy": [11, 4], "snake": "Enemy 2"}, {"xy": [12, 4], "state": "empty"}, {"xy": [13, 4], "state": "empty"}, {"xy": [14, 4], "state": "empty"}, {"xy": [15, 4], "state": "empty"}, {"xy": [16, 4], "state": "empty"}, {"xy": [17, 4], "state": "empty"}, {"xy": [18, 4], "state": "empty"}, {"xy": [19, 4], "state": "empty"}], [{"xy": [0, 5], "state": "empty"}, {"xy": [1, 5], "state": "empty"}, {"xy": [2, 5], "state": "empty"}, {"xy": [3, 5], "state": "empty"}, {"xy": [4, 5], "state": "empty"}, {"xy": [5, 5], "state": "empty"}, {"xy": [6, 5], "state": "empty"}, {"xy": [7, 5], "state": "empty"}, {"xy": [8, 5], "state": "empty"}, {"xy": [9, 5], "state": "empty"}, {"xy": [10, 5], "state": "empty"}, {"state": "head", "xy": [11, 5], "snake": "Enemy 2"}, {"xy": [12, 5], "state": "empty"}, {"xy": [13, 5], "state": "food"}, {"xy": [14, 5], "state": "empty"}, {"xy": [15, 5], "state": "empty"}, {"xy": [16, 5], "state": "empty"}, {"xy": [17, 5], "state": "empty"}, {"xy": [18, 5], "state": "empty"}, {"xy": [19, 5], "state": "empty"}], [{"xy": [0, 6], "state": "empty"}, {"xy": [1, 6], "state": "empty"}, {"xy": [2, 6], "state": "empty"}, {"xy": [3, 6], "state": "empty"}, {"xy": [4, 6], "state": "empty"}, {"xy": [5, 6], "state": "empty"}, {"xy": [6, 6], "state": "empty"}, {"xy": [7, 6], "state": "empty"}, {"xy": [8, 6], "state": "empty"}, {"xy": [9, 6], "state": "empty"}, {"xy": [10, 6], "state": "empty"}, {"xy": [11, 6], "state": "empty"}, {"xy": [12, 6], "state": "empty"}, {"xy": [13, 6], "state": "empty"}, {"xy": [14, 6], "state": "empty"}, {"xy": [15, 6], "state": "empty"}, {"xy": [16, 6], "state": "empty"}, {"xy": [17, 6], "state": "empty"}, {"xy": [18, 6], "state": "empty"}, {"xy": [19, 6], "state": "empty"}], [{"xy": [0, 7], "state": "empty"}, {"xy": [1, 7], "state": "empty"}, {"xy": [2, 7], "state": "empty"}, {"xy": [3, 7], "state": "empty"}, {"xy": [4, 7], "state": "empty"}, {"xy": [5, 7], "state": "empty"}, {"xy": [6, 7], "state": "empty"}, {"xy": [7, 7], "state": "empty"}, {"xy": [8, 7], "state": "empty"}, {"xy": [9, 7], "state": "empty"}, {"xy": [10, 7], "state": "empty"}, {"xy": [11, 7], "state": "empty"}, {"xy": [12, 7], "state": "empty"}, {"xy": [13, 7], "state": "empty"}, {"xy": [14, 7], "state": "empty"}, {"xy": [15, 7], "state": "empty"}, {"xy": [16, 7], "state": "empty"}, {"xy": [17, 7], "state": "empty"}, {"xy": [18, 7], "state": "empty"}, {"xy": [19, 7], "state": "empty"}], [{"xy": [0, 8], "state": "empty"}, {"xy": [1, 8], "state": "empty"}, {"xy": [2, 8], "state": "empty"}, {"xy": [3, 8], "state": "empty"}, {"xy": [4, 8], "state": "empty"}, {"state": "body", "xy": [5, 8], "snake": "Medusa"}, {"state": "body", "xy": [6, 8], "snake": "Medusa"}, {"state": "head", "xy": [7, 8], "snake": "Medusa"}, {"xy": [8, 8], "state": "empty"}, {"xy": [9, 8], "state": "empty"}, {"xy": [10, 8], "state": "empty"}, {"xy": [11, 8], "state": "empty"}, {"xy": [12, 8], "state": "empty"}, {"xy": [13, 8], "state": "empty"}, {"xy": [14, 8], "state": "empty"}, {"xy": [15, 8], "state": "empty"}, {"xy": [16, 8], "state": "empty"}, {"xy": [17, 8], "state": "empty"}, {"xy": [18, 8], "state": "empty"}, {"xy": [19, 8], "state": "empty"}], [{"xy": [0, 9], "state": "empty"}, {"xy": [1, 9], "state": "empty"}, {"xy": [2, 9], "state": "empty"}, {"xy": [3, 9], "state": "empty"}, {"xy": [4, 9], "state": "empty"}, {"state": "body", "xy": [5, 9], "snake": "Medusa"}, {"xy": [6, 9], "state": "empty"}, {"xy": [7, 9], "state": "empty"}, {"xy": [8, 9], "state": "empty"}, {"xy": [9, 9], "state": "empty"}, {"xy": [10, 9], "state": "empty"}, {"xy": [11, 9], "state": "empty"}, {"xy": [12, 9], "state": "empty"}, {"xy": [13, 9], "state": "empty"}, {"xy": [14, 9], "state": "empty"}, {"xy": [15, 9], "state": "empty"}, {"xy": [16, 9], "state": "empty"}, {"xy": [17, 9], "state": "empty"}, {"xy": [18, 9], "state": "empty"}, {"xy": [19, 9], "state": "empty"}], [{"xy": [0, 10], "state": "empty"}, {"xy": [1, 10], "state": "empty"}, {"xy": [2, 10], "state": "empty"}, {"xy": [3, 10], "state": "empty"}, {"state": "body", "xy": [4, 10], "snake": "Medusa"}, {"state": "body", "xy": [5, 10], "snake": "Medusa"}, {"xy": [6, 10], "state": "empty"}, {"xy": [7, 10], "state": "empty"}, {"xy": [8, 10], "state": "empty"}, {"xy": [9, 10], "state": "empty"}, {"xy": [10, 10], "state": "empty"}, {"xy": [11, 10], "state": "empty"}, {"xy": [12, 10], "state": "empty"}, {"xy": [13, 10], "state": "empty"}, {"xy": [14, 10], "state": "empty"}, {"xy": [15, 10], "state": "empty"}, {"xy": [16, 10], "state": "empty"}, {"xy": [17, 10], "state": "empty"}, {"xy": [18, 10], "state": "empty"}, {"xy": [19, 10], "state": "empty"}], [{"xy": [0, 11], "state": "empty"}, {"xy": [1, 11], "state": "empty"}, {"xy": [2, 11], "state": "empty"}, {"xy": [3, 11], "state": "empty"}, {"xy": [4, 11], "state": "empty"}, {"xy": [5, 11], "state": "empty"}, {"xy": [6, 11], "state": "empty"}, {"xy": [7, 11], "state": "empty"}, {"xy": [8, 11], "state": "empty"}, {"xy": [9, 11], "state": "empty"}, {"xy": [10, 11], "state": "empty"}, {"xy": [11, 11], "state": "empty"}, {"xy": [12, 11], "state": "empty"}, {"xy": [13, 11], "state": "empty"}, {"xy": [14, 11], "state": "empty"}, {"xy": [15, 11], "state": "empty"}, {"xy": [16, 11], "state": "empty"}, {"xy": [17, 11], "state": "empty"}, {"xy": [18, 11], "state": "empty"}, {"xy": [19, 11], "state": "empty"}], [{"xy": [0, 12], "state": "empty"}, {"xy": [1, 12], "state": "empty"}, {"xy": [2, 12], "state": "empty"}, {"xy": [3, 12], "state": "empty"}, {"xy": [4, 12], "state": "empty"}, {"xy": [5, 12], "state": "empty"}, {"xy": [6, 12], "state": "empty"}, {"xy": [7, 12], "state": "empty"}, {"xy": [8, 12], "state": "empty"}, {"xy": [9, 12], "state": "empty"}, {"state": "head", "xy": [10, 12], "snake": "Enemy 1"}, {"xy": [11, 12], "state": "empty"}, {"xy": [12, 12], "state": "empty"}, {"xy": [13, 12], "state": "empty"}, {"xy": [14, 12], "state": "empty"}, {"xy": [15, 12], "state": "empty"}, {"xy": [16, 12], "state": "food"}, {"xy": [17, 12], "state": "empty"}, {"xy": [18, 12], "state": "empty"}, {"xy": [19, 12], "state": "empty"}], [{"xy": [0, 13], "state": "empty"}, {"xy": [1, 13], "state": "empty"}, {"xy": [2, 13], "state": "empty"}, {"xy": [3, 13], "state": "empty"}, {"xy": [4, 13], "state": "empty"}, {"xy": [5, 13], "state": "empty"}, {"xy": [6, 13], "state": "empty"}, {"xy": [7, 13], "state": "empty"}, {"xy": [8, 13], "state": "empty"}, {"xy": [9, 13], "state": "empty"}, {"state": "body", "xy": [10, 13], "snake": "Enemy 1"}, {"xy": [11, 13], "state": "empty"}, {"xy": [12, 13], "state": "empty"}, {"xy": [13, 13], "state": "empty"}, {"xy": [14, 13], "state": "empty"}, {"xy": [15, 13], "state": "empty"}, {"xy": [16, 13], "state": "empty"}, {"xy": [17, 13], "state": "empty"}, {"xy": [18, 13], "state": "empty"}, {"xy": [19, 13], "state": "empty"}], [{"xy": [0, 14], "state": "empty"}, {"xy": [1, 14], "state": "empty"}, {"xy": [2, 14], "state": "empty"}, {"xy": [3, 14], "state": "empty"}, {"xy": [4, 14], "state": "empty"}, {"xy": [5, 14], "state": "empty"}, {"xy": [6, 14], "state": "empty"}, {"xy": [7, 14], "state": "empty"}, {"xy": [8, 14], "state": "empty"}, {"xy": [9, 14], "state": "empty"}, {"state": "body", "xy": [10, 14], "snake": "Enemy 1"}, {"xy": [11, 14], "state": "empty"}, {"xy": [12, 14], "state": "empty"}, {"xy": [13, 14], "state": "empty"}, {"xy": [14, 14], "state": "empty"}, {"xy": [15, 14], "state": "empty"}, {"xy": [16, 14], "state": "empty"}, {"xy": [17, 14], "state": "empty"}, {"xy": [18, 14], "state": "empty"}, {"xy": [19, 14], "state": "empty"}], [{"xy": [0, 15], "state": "empty"}, {"xy": [1, 15], "state": "empty"}, {"xy": [2, 15], "state": "empty"}, {"xy": [3, 15], "state": "empty"}, {"xy": [4, 15], "state": "empty"}, {"xy": [5, 15], "state": "empty"}, {"xy": [6, 15], "state": "empty"}, {"xy": [7, 15], "state": "empty"}, {"xy": [8, 15], "state": "empty"}, {"xy": [9, 15], "state": "empty"}, {"state": "body", "xy": [10, 15], "snake": "Enemy 1"}, {"xy": [11, 15], "state": "empty"}, {"xy": [12, 15], "state": "empty"}, {"xy": [13, 15], "state": "empty"}, {"xy": [14, 15], "state": "empty"}, {"xy": [15, 15], "state": "empty"}, {"xy": [16, 15], "state": "empty"}, {"xy": [17, 15], "state": "empty"}, {"xy": [18, 15], "state": "empty"}, {"xy": [19, 15], "state": "empty"}], [{"xy": [0, 16], "state": "empty"}, {"xy": [1, 16], "state": "empty"}, {"xy": [2, 16], "state": "empty"}, {"xy": [3, 16], "state": "empty"}, {"xy": [4, 16], "state": "empty"}, {"xy": [5, 16], "state": "empty"}, {"xy": [6, 16], "state": "empty"}, {"xy": [7, 16], "state": "food"}, {"xy": [8, 16], "state": "empty"}, {"xy": [9, 16], "state": "empty"}, {"xy": [10, 16], "state": "empty"}, {"xy": [11, 16], "state": "empty"}, {"xy": [12, 16], "state": "empty"}, {"xy": [13, 16], "state": "empty"}, {"xy": [14, 16], "state": "empty"}, {"xy": [15, 16], "state": "empty"}, {"xy": [16, 16], "state": "food"}, {"xy": [17, 16], "state": "empty"}, {"xy": [18, 16], "state": "empty"}, {"xy": [19, 16], "state": "empty"}], [{"xy": [0, 17], "state": "empty"}, {"xy": [1, 17], "state": "empty"}, {"xy": [2, 17], "state": "empty"}, {"xy": [3, 17], "state": "empty"}, {"xy": [4, 17], "state": "empty"}, {"xy": [5, 17], "state": "empty"}, {"xy": [6, 17], "state": "empty"}, {"xy": [7, 17], "state": "empty"}, {"xy": [8, 17], "state": "empty"}, {"xy": [9, 17], "state": "empty"}, {"xy": [10, 17], "state": "empty"}, {"xy": [11, 17], "state": "empty"}, {"xy": [12, 17], "state": "empty"}, {"xy": [13, 17], "state": "empty"}, {"xy": [14, 17], "state": "empty"}, {"xy": [15, 17], "state": "empty"}, {"xy": [16, 17], "state": "empty"}, {"xy": [17, 17], "state": "empty"}, {"xy": [18, 17], "state": "empty"}, {"xy": [19, 17], "state": "empty"}], [{"xy": [0, 18], "state": "empty"}, {"xy": [1, 18], "state": "empty"}, {"xy": [2, 18], "state": "empty"}, {"xy": [3, 18], "state": "empty"}, {"xy": [4, 18], "state": "empty"}, {"xy": [5, 18], "state": "empty"}, {"xy": [6, 18], "state": "empty"}, {"xy": [7, 18], "state": "empty"}, {"xy": [8, 18], "state": "empty"}, {"xy": [9, 18], "state": "empty"}, {"xy": [10, 18], "state": "empty"}, {"xy": [11, 18], "state": "empty"}, {"xy": [12, 18], "state": "empty"}, {"xy": [13, 18], "state": "empty"}, {"xy": [14, 18], "state": "empty"}, {"xy": [15, 18], "state": "empty"}, {"xy": [16, 18], "state": "empty"}, {"xy": [17, 18], "state": "empty"}, {"xy": [18, 18], "state": "empty"}, {"xy": [19, 18], "state": "empty"}], [{"xy": [0, 19], "state": "empty"}, {"xy": [1, 19], "state": "empty"}, {"xy": [2, 19], "state": "empty"}, {"xy": [3, 19], "state": "empty"}, {"xy": [4, 19], "state": "empty"}, {"xy": [5, 19], "state": "empty"}, {"xy": [6, 19], "state": "empty"}, {"xy": [7, 19], "state": "empty"}, {"xy": [8, 19], "state": "empty"}, {"xy": [9, 19], "state": "empty"}, {"xy": [10, 19], "state": "empty"}, {"xy": [11, 19], "state": "empty"}, {"xy": [12, 19], "state": "empty"}, {"xy": [13, 19], "state": "empty"}, {"xy": [14, 19], "state": "empty"}, {"xy": [15, 19], "state": "empty"}, {"xy": [16, 19], "state": "empty"}, {"xy": [17, 19], "state": "empty"}, {"xy": [18, 19], "state": "empty"}, {"xy": [19, 19], "state": "empty"}]], "food": [[2, 2], [7, 16], [16, 16], [16, 12], [13, 5]]}
}!

startData() {
	return {"game_id": "test-game", "width": 20, "height": 20};
}! !

!Battlesnake.WormHoleClient methodsFor: 'initialize'!

mainPath() {
	// *** This method was defined by AppeX.ApplicationClient as a subclass responsibility.
	// Replace its body with a proper implementation. *** 

	this.debug('Subclass responsibility stub not reimplemented');
}! !

!Battlesnake.WormHoleClient methodsFor: 'ajax'!

testSuccess(result, status, xhr){
	console.log(result);
}!

testRequest(data, url) {
	var self = this,
		jsonData = JSON.stringify(data);
	$.ajax({
		url: url,
		type: "POST",
		contentType: "application/x-www-form-urlencoded",
		data: jsonData,
		success: function(result, status, xhr) {self.testSuccess(result, status, xhr)},
		error: function(xhr, status, errorCode) {self.testFailed(xhr, status, errorCode)}
	})
}!

testFailed(xhr, status, errorCode) {
	console.log(xhr, status, errorCode);
}! !

!Battlesnake.WormHoleClient methodsFor: 'battlesnake API'!

testMove() {
	
	this.testRequest(this.exampleGameData(), "../move");
}!

testStart() {

	this.testRequest(this.startData(), "../start");
}! !


!Battlesnake.BoardStateChanged class methodsFor: 'instance creation'!

onTile: aTile

	^ self new
		tile: aTile;
		yourself! !


!Battlesnake.BoardStateChanged methodsFor: 'accessing'!

tile: anObject

	tile := anObject!

tile

	^tile! !


!Battlesnake.Board class methodsFor: 'accessing'!

directions

	^ Directions! !

!Battlesnake.Board class methodsFor: 'instance creation'!

defaultBoard

	^ self width: 20 height: 20!

width: width height: height

	^ self new
		width: width height: height;
		yourself! !


!Battlesnake.Board methodsFor: 'accessing'!

topLeft

	^ rows first first!

medusa

	^medusa!

topRight

	^ rows first last!

goldCoins: anObject

	goldCoins := anObject!

nearTopRight

	^ self bottomRight south south west west!

cornerTiles

	^ Array
		with: self topLeft
		with: self topRight
		with: self bottomRight
		with: self bottomLeft!

nearBottomLeft

	^ self bottomLeft north north east east!

at: aPoint
"
	aPoint is a zero-based coordinate of a tile. Adjust indexes to Smalltalk one-based.
"

	^ (rows at: aPoint y + 1) at: aPoint x + 1!

game

	^game!

snakes

	^ snakes!

game: anObject

	game := anObject!

dimensions

	^ self width @ self height!

width

	^ rows any size!

height

	^ rows size!

bottomRight

	^ rows last last!

foods

	^foods!

goldCoins

	^goldCoins!

medusa: aMedusa

	medusa := aMedusa!

nearBottomRight

	^ self bottomRight north north west west!

nearTopLeft

	^ self bottomLeft south south east east!

rows

	^rows!

directions

	^ self class directions!

bottomLeft

	^ rows last first! !

!Battlesnake.Board methodsFor: 'testing'!

allTiles
"
	(self defaultBoard allTiles)
"
	^ self rows inject: OrderedCollection new into: [ :tiles :row |
		tiles addAll: row;
		yourself ]!

isEmpty

	^ self allTiles allSatisfy: [:eachTile | eachTile isEmpty]! !

!Battlesnake.Board methodsFor: 'sorting'!

sortItems: items by: aBlock
"
	Answer the closest of the items where aBlock determines which distance we use.
"

	items isEmpty ifTrue: [ ^ #() ].
	
	^ items sorted: [ :a :b | (aBlock value: a) <= (aBlock value: b) ].!

weakestSnake

	| sorted |
	
	sorted := self snakesByPower.
	^ sorted isEmpty
		ifTrue: [ nil ]
		ifFalse: [ sorted last ]!

snakesByPower

	^ self sortItems: self snakes by: [:eachSnake | eachSnake power]!

strongestSnake

	| sorted |
	
	sorted := self snakesByPower.
	^ sorted isEmpty
		ifTrue: [ nil ]
		ifFalse: [ sorted first ]! !

!Battlesnake.Board methodsFor: 'actions'!

addSnake: aSnake

	aSnake segments do: [ :each |
		each tile content: each.
		self announce: (BoardStateChanged onTile: each tile).
		].
	
	^ snakes at: aSnake snakeName put: aSnake!

putFoodAt: aPoint

	| tile food |
	tile := self at: aPoint.
	tile hasFood ifTrue: [ ^ self ].
	food := Food new.
	tile content: food.
	foods at: tile put: food.
	self announce: (BoardStateChanged onTile: tile).!

putWallAt: aPoint

	| tile wall |
	tile := self at: aPoint.
	tile hasWall ifTrue: [ ^ self ].
	wall := Wall new.
	tile content: wall.
	walls at: tile put: wall.
	self announce: (BoardStateChanged onTile: tile).!

removeFood: aFood

	foods removeKey: aFood tile ifAbsent: [nil].
	aFood tile: nil!

removeSnake: aSnake

	aSnake segments do: [ :each |
		each tile content: nil.
		].
	
	^ snakes removeKey: aSnake ifAbsent: [nil]!

putGoldAt: aPoint

	| tile  gold |
	tile := self at: aPoint.
	tile hasGold ifTrue: [ ^ self ].
	gold := GoldCoin new.
	tile content: gold.
	goldCoins at: tile put: gold.
	self announce: (BoardStateChanged onTile: tile).! !

!Battlesnake.Board methodsFor: 'initialize-release'!

resetFoods

	foods := IdentityDictionary new!

initialize

	super initialize.
	snakes := Dictionary new.
	self
		resetFoods;
		resetGoldCoins;
		resetWalls!

resetGoldCoins

	goldCoins ifNotNil: [ goldCoins do: [ :each |
			each tile resetContent.
			]].
	
	goldCoins := IdentityDictionary new!

resetWalls

	walls := IdentityDictionary new!

width: width height: height


	rows := Array new: height.
	"Create all the Tiles."
	1 to: height do: [ :y |
		| cells |
		cells := Array new: width.
		rows at: y put: cells.
		1 to: width do: [ :x |
			cells at: x put: (BoardTile on: self at: (x - 1) @ (y - 1)).
			]
		].
	
	"Now link Tiles to become neighbors"
	rows inject: nil into: [ :northRow :eachRow |
		northRow ifNotNil: [
			northRow with: eachRow do: [:northTile :eachTile |
				eachTile north: northTile]
			].
		eachRow inject: nil into: [ :west : tile |
			west ifNotNil: [tile west: west].
			tile].
		eachRow
		]! !

!Battlesnake.Board methodsFor: 'printing'!

printOn: aStream

	aStream nextPutAll: self jsonState! !

!Battlesnake.Board methodsFor: 'accessing state'!

state
"
	Answer a collection of objects used to determine my state.
	(self defaultBoard state)
"
	^ self rows collect: [ :eachRow | eachRow collect:#state ]!

resetTileStates

	self allTiles do: #resetContent.
	self
		resetFoods;
		resetGoldCoins;
		resetWalls!

updateState: aState
"
	aState will be a Dictionary with the following keys:
		game_id
		turn
		board
		snakes
		food
	Since the board information is redundant to the combination of 'snakes' and 'food', we will only concern ourselves with those.
"

	self resetTileStates.
	self updateFoodState: (aState at: #food ifAbsent: [ #() ]).

	self updateGoldState:(aState at:#gold ifAbsent:[#()]).
	self updateWallState:(aState at:#wall ifAbsent:[#()]).
	self updateAllSnakesState: (aState at: #snakes ifAbsent: [ #() ]).!

updateFoodState: anArray
"
	From https://github.com/sendwithus/battlesnake-legacy#post-move :
	
	  food: [[1, 4], [3, 0], [5, 2]]
"

	anArray do: [ :each | self putFoodAt: each first @ each last ]!

jsonState

	^ Game jsonEncode: self state!

updateAllSnakesState: anArray
	"
	From https://github.com/sendwithus/battlesnake-legacy#post-move :
	
	  snakes:[<Snake>, <Snake>, ...]
	
"

	anArray do: [:snakeState | self updateSingleSnakeState: snakeState]!

updateWallState: anArray
""

	anArray do: [ :each | self putWallAt: each first @ each last ]!

updateGoldState: anArray
""

	anArray do: [ :each | self putGoldAt: each first @ each last ]!

updateSingleSnakeState: snakeState
"
"
	| snake snakeName snakeId |
	snakeName := snakeState at: #name.
	snakeId := snakeState at: #id.
	snake := snakes at: snakeId
				ifAbsent: 
					[| snakeClass |
					snakeClass := snakeId = Medusa snakeId
								ifTrue: [Medusa]
								ifFalse: [Snake].
					snake := (snakeClass on: self)
						snakeName: snakeName;
						yourself.
					self addSnake: snake.
					snake].
	^snake
		updateState: snakeState;
		yourself! !


!Battlesnake.Food methodsFor: 'testing'!

isFood

	^ true!

isObstacle

	^ false! !

!Battlesnake.Food methodsFor: 'accessing state'!

stateDescription

	^ 'food'! !


!Battlesnake.GoldCoin methodsFor: 'testing'!

isObstacle

	^ false! !

!Battlesnake.GoldCoin methodsFor: 'accessing state'!

isGold

	^true!

stateDescription
	" *** This method was defined by Battlesnake.TileContent as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	^'gold'! !


!Battlesnake.TileStateChanged class methodsFor: 'instance creation'!

on: aTile

	^ self new
		tile: aTile;
		yourself! !


!Battlesnake.TileStateChanged methodsFor: 'accessing'!

tile: anObject

	tile := anObject!

tile

	^tile! !


!Battlesnake.Wall methodsFor: 'accessing state'!

isWall

	^true!

stateDescription
	" *** This method was defined by Battlesnake.TileContent as a subclass responsibility.
	Replace its body with a proper implementation. *** "
^'wall'! !


!Battlesnake.Body methodsFor: 'accessing'!

previousSegment

	^previousSegment!

previousSegment: anObject

	previousSegment := anObject! !

!Battlesnake.Body methodsFor: 'accessing state'!

stateDescription

	^ 'body'! !

!Battlesnake.Body methodsFor: 'testing'!

isSnakeBody

	^ true! !


!Core.Point methodsFor: 'accessing'!

battlesnakeDistance

	^ x abs + y abs! !


!AppeX.Application class methodsFor: 'html'!

htmlDocument
	"Take the htmlTemplate and expand it to resolve the tokens in it to their actual values."
	<GET>
	<json: ''>

	^ nil! !


!SiouX.Server class methodsFor: 'configuration'!

battlesnakeServer: server

	<server: 'Battlesnake Server'>
	server listenOn: 8889 for: HttpConnection! !



#{Battlesnake.Directions} initialize!

#{Battlesnake.HighPassingCost} initialize!

#{Battlesnake.RiskCost} initialize!

#{Battlesnake.StepCost} initialize!