'From VisualWorks®, 8.1 of 24 July, 2015 on 19 February, 2016 at 6:08:35 PM'!


CodeComponent create: #package named: 'Battlesnake-Tests'!"Package Battlesnake-Tests(0.6,jkott)="!


CodeComponent type: #package named: 'Battlesnake-Tests' property: #prerequisiteParcels value: #(#('Battlesnake' '') #('SUnit' '') #('SUnitToo' ''))!

CodeComponent type: #package named: 'Battlesnake-Tests' property: #developmentPrerequisites value: #(#(#any 'Battlesnake' '') #(#any 'SUnit' '') #(#any 'SUnitToo' ''))!

CodeComponent type: #package named: 'Battlesnake-Tests' property: #prerequisiteDescriptions value: #(#(#name 'Battlesnake' #componentType #package) #(#name 'SUnit' #componentType #package) #(#name 'SUnitToo' #componentType #package))!

Smalltalk.Battlesnake defineClass: #SnakeTest
	superclass: #{SUnit.TestCase}
	indexedType: #none
	private: false
	instanceVariableNames: 'board snake '
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #GameTest
	superclass: #{SUnit.TestCase}
	indexedType: #none
	private: false
	instanceVariableNames: 'host port '
	classInstanceVariableNames: ''
	imports: '
			private Net.*
			private SiouX.*
			private Xtreams.*
			'
	category: ''!

Smalltalk.Battlesnake defineClass: #BoardTest
	superclass: #{SUnit.TestCase}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #TestObstacle
	superclass: #{Battlesnake.TileContent}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

Smalltalk.Battlesnake defineClass: #BattlesnakeTest
	superclass: #{XProgramming.SUnit.TestCase}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: ''!

!Battlesnake.SnakeTest methodsFor: 'initialize-release'!

setUp

	super setUp.
	board := Board defaultBoard!

tearDown

	board := nil.
	^ super tearDown! !

!Battlesnake.SnakeTest methodsFor: 'tests'!

testMedusaBubble

	| coordinates bubble bubbleShift |
	coordinates := #(#(3 5) #(3 6) #(3 7) #(4 7)).
	snake := Medusa on: board.
	snake updateCoordinates: coordinates.

	bubble := snake bubble.
	self assert: bubble size > 0.
	
	bubbleShift := snake bubbleShift.
	self assert: bubbleShift class == Point.
	self assert: (bubbleShift x between: -1 and: 1).
	self assert: (bubbleShift y between: -1 and: 1).!

testSnakeBody

	| coordinates head count tail |
	coordinates := #(#(3 5) #(3 6) #(3 7) #(4 7)).
	snake := Snake on: board.
	snake updateCoordinates: coordinates.
	head := snake head.
	tail := snake tail.
	
	self assert: head notNil.
	self assert: head class == Head.
	self assert: head isSnakePart.
	self assert: head isSnakeHead.
	self assert: head isSnakeBody not.
	self assert: head position = (coordinates first first @ coordinates first last).
	self assert: snake power = coordinates size.

	count := 0.	
	snake segments with: coordinates do: [ :segment :coord |
		count := count + 1.
		self assert: segment position = (coord first @ coord last).
		self assert: segment tailLength = (snake power - count).
		].
	
	self assert: tail ~~ head.
	self assert: tail position = (coordinates last first @ coordinates last last).
	self assert: tail class == Body.
	self assert: tail isSnakePart.
	self assert: tail isSnakeBody.
	self assert: tail isSnakeHead not.
	self assert: tail tailLength = 0.!

testNewSnake

	| head |
	snake := Snake on: board.

	self assert: snake head isNil.
	self assert: snake segments isEmpty.
	self assert: snake tail isNil.
	
	snake updateCoordinates: #(#(3, 5)).
	
	head := snake head.
	self assert: head notNil.
	self assert: head class == Head.
	self assert: head isSnakePart.
	self assert: head isSnakeHead. 
	self assert: head tile position = (3 @ 5).
	self assert: snake power = 1.
	self assert: snake tail == head.
	self assert: head tailLength = 0!

testSnakeFindFood

	| game medusa target nextMove |
	
	game := Game exampleGame.
	board := game board.
	medusa := game medusa.
	
	medusa
		resetBehaviors;
		pushBehavior: #findFood.
	
	self assert: medusa currentBehavior = #findFood.
	
	nextMove := medusa behave.
	self assert: nextMove = (0 @ -1).
	self assert: medusa nextMoveDirection = #up.
	self assert: medusa path notNil.
	self assert: (target := medusa path last) hasFood.
	medusa doMove.
	
	medusa addBehavior: #moveAlong.
	medusa nextBehavior.
	
	[medusa tile == target] whileFalse: [
		self assert: medusa currentBehavior = #moveAlong.
		self assert: medusa nextMove battlesnakeDistance = 1.
		medusa behave.
		medusa doMove
		]! !


!Battlesnake.GameTest methodsFor: 'tests - HTTP'!

testStartToEnd

	WormHole resetGame.

	self
		runPostStart;
		runPostMove;
		runPostEnd!

testPostMove

	self runPostStart.
	self runPostMove!

testGetIndex

	| response |
	response := HttpClient get: (self urlString: '/').
	
	self assert: response notNil.
	self assert: response code = '200'.
	self assert: response contents = '<a href="https://github.com/JerryKott/battlesnake">Medusa</a>'.!

testPostEnd

	self runPostStart.
	self runPostEnd!

testPostStart

	self runPostStart! !

!Battlesnake.GameTest methodsFor: 'accessing'!

hostPortString

	^ host, ':', port printString!

urlString: path

	^ 'http://', self hostPortString, path!

newRequestFor: stateData path: path

	| request |
	request := Net.HttpRequest post: (self urlString: path).
	request contents: (WormHole encodeFormData: stateData).
	^request! !

!Battlesnake.GameTest methodsFor: 'running tests'!

runPostEnd

	| request response state decoded |
	state := self endGameState.
	request := self newRequestFor: state path: '/end'.
	response := request execute.
	
	self assert: response notNil.
	self assert: response isSuccess.
	self assert: response contentType = 'application/json'.
	decoded := JSON decode: response contents.
	self assert: decoded notNil.
	self assert: decoded keys sorted = #(status).
	self assert: (decoded at: #status) = 'Game Over'!

runPostMove

	| request response state decoded |
	state := self moveState.
	request := self newRequestFor: state path: '/move'.
	response := request execute.
	
	self assert: response notNil.
	self assert: response isSuccess.
	self assert: response contentType = 'application/json'.
	decoded := JSON decode: response contents.
	self assert: decoded notNil.
	self assert: decoded keys sorted = #(move taunt)!

runPostStart

	"state keysAndValuesDo: [ :key :value | request addFormKey: key value: value ]."

	| request response state decoded |
	state := self startGameState.
	request := self newRequestFor: state path: '/start'.
	response := request execute.
	self assert: response notNil.
	self assert: response isSuccess.
	self assert: response contentType = 'application/json'.
	decoded := JSON decode: response contents.
	self assert: decoded notNil.
	self assert: decoded keys sorted = #(#color #head_url #name #taunt)! !

!Battlesnake.GameTest methodsFor: 'tests'!

endGameState
	
	^ Dictionary with: #game_id -> 'test-game'!

startGameState
	
	^ Dictionary
		with: #game_id -> 'test-game'
		with: #width -> 20
		with: #height -> 20!

moveState


	^ Game exampleGame
		turn: 5;	
		state.!

testGameCreation

	| game state |
	state := self startGameState.
	game := Game fromState: state.
	
	self assert: game medusa class == Medusa.
	self assert: game board isEmpty.
	self assert: game gameName = (state at: #game_id).
	self assert: game board width = (state at: #width).
	self assert: game board height = (state at: #height).
	self assert: game medusa power = 0.
	self assert: game medusa head isNil! !

!Battlesnake.GameTest methodsFor: 'initialize-release'!

setUp

	| server |
	super setUp.
	server := SiouX.Server id: 'Battlesnake Server'.
	server start.
	host := 'localhost'.
	port := server listeners first port.! !


!Battlesnake.BoardTest methodsFor: 'testing'!

testExampleBoard

	| board |
	
	board := Board exampleBoard.
	
	self assert: board snakes notEmpty.
	self assert: board foods notEmpty.!

testBestPathWithObstacles

	| board path time |

	board := Board defaultBoard.
	board
		putTestObstacleAt: 0 @ 5;
		putTestObstacleAt: 1 @ 5;
		putTestObstacleAt: 2 @ 5;
		putTestObstacleAt: 3 @ 5;
		putTestObstacleAt: 10 @ 4;
		putTestObstacleAt: 10 @ 5;
		putTestObstacleAt: 10 @ 6;
		putTestObstacleAt: 19 @ 15;
		putTestObstacleAt: 18 @ 15;
		putTestObstacleAt: 17 @ 15;
		putTestObstacleAt: 16 @ 15;
		putTestObstacleAt: 15 @ 15;
		putTestObstacleAt: 14 @ 15;
		putTestObstacleAt: 14 @ 16;
		putTestObstacleAt: 17 @ 19;
		putTestObstacleAt: 17 @ 18;
		putTestObstacleAt: 17 @ 17.
	
	time := [path := board topLeft findPathTo: board bottomRight] timeToRun.
	self assert: time < 100 milliseconds.
	self assert: path last == board bottomRight.

	path := board topRight findPathTo: board bottomRight.
	self assert: path last == board bottomRight.

	path := board topRight findPathTo: board bottomLeft.
	self assert: path last == board bottomLeft.

	path := board topLeft findPathTo: board bottomLeft.
	self assert: path last == board bottomLeft.!

testInsideNeighbours

	| board dimensions tile |
	dimensions := 20 @ 20.
	board := Board width: dimensions x height: dimensions y.
	
	1 to: dimensions x - 2 do: [ :x |
		1 to: dimensions y - 2 do: [ :y |
			tile := board at: x @ y.
			self assert: tile neighbours size = 4.
			self assert: tile north south == tile.
			self assert: tile east west == tile.
			self assert: tile south north == tile.
			self assert: tile west east == tile.
			self assert: tile north east south west == tile.
			self assert: tile north west south east == tile.
			self assert: tile south east north west == tile.
			self assert: tile south west north east == tile.
			]
		]!

testBestPath

	| board path time |

	board := Board defaultBoard.
	
	time := [path := board topLeft findPathTo: board bottomLeft] timeToRun.
	"The following assertion will fail if the above code is interrupted by a breakpoint etc."
	self assert: time < 100 milliseconds.
	self assert: path notNil.
	self assert: path size = (board height - 1).
	self assert: path last == board bottomLeft.
	
	path := board topLeft findPathTo: board bottomRight.
	self assert: path notNil.
	self assert: path size = (board height + board width - 2).
	self assert: path last == board bottomRight.
	self assert: (path allSatisfy: [:eachTile | eachTile isEmpty])!

testCorners

	| board dimensions tile neighbor |

	board := Board defaultBoard.
	dimensions := board dimensions.
	
	"Test upper-left tile:"
	tile := board at: 0@0.
	self assert: tile north isNil.
	self assert: tile west isNil.
	neighbor := tile east.
	self assert: neighbor notNil.
	self assert: neighbor west == tile.
	neighbor := tile south.
	self assert: neighbor notNil.
	self assert: neighbor north == tile.
	

	"Test upper-right tile:"
	tile := board at: (dimensions x - 1) @ 0.
	self assert: tile north isNil.
	self assert: tile east isNil.
	neighbor := tile west.
	self assert: neighbor notNil.
	self assert: neighbor east == tile.
	neighbor := tile south.
	self assert: neighbor notNil.
	self assert: neighbor north == tile.
	
	"Test bottom-right tile:"
	tile := board at: (dimensions x - 1) @ (dimensions y - 1).
	neighbor := tile north.	
	self assert: neighbor notNil.
	self assert: neighbor south == tile.
	self assert: tile east isNil.
	neighbor := tile west.
	self assert: neighbor notNil.
	self assert: neighbor east == tile.
	self assert: tile south isNil.

	"Test bottom-left tile:"
	tile := board at: 0 @ (dimensions y - 1).
	neighbor := tile north.	
	self assert: neighbor notNil.
	self assert: neighbor south == tile.
	self assert: tile west isNil.
	neighbor := tile east.
	self assert: neighbor notNil.
	self assert: neighbor west == tile.
	self assert: tile south isNil.!

testNodeDistances

	| board size node |
	size := 20 @ 20.
	board := Board width: size x height: size y.
	node := PathNode
		on: board topLeft
		target: board bottomRight .
	
	self assert: node distanceToTarget = (size x + size y - 2)!

testSimplePath

	|myBoard path start end |
	
	myBoard:= Board defaultBoard.
	
	(Array
		with: ((2 @ 3) corner: (7 @ 7))
		with: ((10 @ 15) corner: (7 @ 7))
		with: ((2 @ 15) corner: (7 @ 7))
		with: ((10 @ 3) corner: (7 @ 7))) do: [ :rectangle |
			start := myBoard at: rectangle origin.
			end := myBoard at: rectangle corner.
			path := start simplePathTo: end.
			self assert: path size = (start distanceTo: end)			
			]! !


!Battlesnake.TestObstacle methodsFor: 'accessing state'!

stateDescription
	
	^ 'obstacle'! !


!Battlesnake.BattlesnakeTest methodsFor: 'tests'!

testJakeSnake! !

!Battlesnake.BattlesnakeTest methodsFor: 'running'!

startData

	^ Dictionary new
		at: #game_id put: 'hairy-cheese';
		at: #width put: 20;
		at: #height put: 20;
		yourself!

boardStateData
	"
	https://github.com/sendwithus/battlesnake-legacy#board-state-objects
	self new boardStateData
"
	" Start with empty board."

	| board |
	board := Board width: 20 height: 20.

	" Put some food on the grid. "
	#(#(2 3) #(3 7) #(3 19) #(5 5) #(12 4) #(16 13))
		do: [:coordinates | board putFoodAt: coordinates first @ coordinates last].

	" Put some snakes on the grid. "
	board addSnake: (Snake exampleOn: board).
	board addSnake: (Snake exampleNoodlezOn: board).
	^board!

runTest: aReceiver

	| startData |
	
	startData := Dictionary new! !


!Battlesnake.Board class methodsFor: 'instance creation'!

exampleBoard
"
	Answer a board populated with some food and snakes.
	(self exampleBoard)
"
	| board |
	
	board := self defaultBoard.

	"Put a bunch of snakes on board"	
	(Snake exampleSnakes: board) do: [ :eachSnake | board addSnake: eachSnake].
	
	"Add some foods here"
	Food exampleCoordinates do: [ :eachPoint | board putFoodAt: eachPoint ].
	
	^ board! !


!Battlesnake.Board methodsFor: 'tests'!

putTestObstacleAt: aPoint

	| tile obstacle |
	obstacle := TestObstacle new.
	tile := self at: aPoint.
	tile content: obstacle.
	obstacle tile: tile.! !


!Battlesnake.Game class methodsFor: 'instance creation'!

exampleGame
"
	(self exampleGame)
"
	| board |
	
	board := Board exampleBoard.
	^ self new
		gameName: 'Example Game';
		board: board;
		medusa: (board snakes at: 'Medusa');
		turn: 0;
		yourself! !


!Battlesnake.Food class methodsFor: 'instance creation'!

exampleCoordinates
"
	Return an Array of Points with the coordinates of food.
"

	^ #(#(2 2) #(13 5) #(16 12) #(7 16 ) #(16 16)) collect: [ :each | each first @ each last]! !


!Battlesnake.Snake class methodsFor: 'example snakes'!

exampleOn: aBoard
	"
	self exampleOn: Board defaultBoard
"

	^(self on: aBoard)
		snakeName: 'example-snake';
		updateCoordinates: #(#(4 6) #(4 7) #(4 8) #(5 8) #(6 8));
		yourself!

exampleEnemy1_on: aBoard
"
	self exampleEnemy1_on: Board defaultBoard
"

	^ aBoard updateSingleSnakeState: self exampleEnemy1_state!

exampleEnemy1_state
"
	self exampleEnemy1_state
"

	^ Dictionary new
		at: #name put: 'Enemy 1';
		at: #coords put: #(#(10 12) #(10 13) #(10 14) #(10 15));
		yourself!

exampleMedusaOn: aBoard
"
	self exampleMedusaOn: Board defaultBoard
"

	^(Medusa on: aBoard)
		snakeName: Medusa defaultSnakeName;
		updateCoordinates: #(#(7 8) #(6 8 ) #(5 8) #(5 9) #(5 10) #(4 10));
		yourself!

exampleEnemy2_on: aBoard
"
	self exampleEnemy2_on: Board defaultBoard
"

	^(self on: aBoard)
		snakeName: 'Enemy 2';
		updateCoordinates: #(#(11 5) #(11 4) #(10 4) #(10 3) #(10 2) #(11 2) #(12 2) #(13 2));
		yourself!

exampleNoodlezOn: aBoard
	"
	self exampleNoodlezOn: Board defaultBoard
"

	^(self on: aBoard)
		snakeName: 'Noodlez';
		updateCoordinates: #(#(0 0) #(0 1) #(0 2) #(1 2));
		yourself!

exampleSnakes: aBoard

	^ Set new
		add: (self exampleMedusaOn: aBoard);
		add: (self exampleEnemy1_on: aBoard);
		add: (self exampleEnemy2_on: aBoard);
		yourself! !

