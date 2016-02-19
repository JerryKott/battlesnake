<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks®, Pre-Release 8.2 (feb16.1) of 5 February, 2016 on 18 February, 2016 at 6:42:04 PM</time-stamp>


<component-created>
<name>Battlesnake-Tests</name> <type>package</type>
</component-created><!-- Package Battlesnake-Tests(0.0.16,jkott)= -->


<component-property>
<name>Battlesnake-Tests</name> <type>package</type>
<property>prerequisiteParcels</property> <value>#(#('Battlesnake' '') #('Battlesnake-Snakesonaplane' '') #('SUnit' '') #('SUnitToo' ''))</value>
</component-property>

<component-property>
<name>Battlesnake-Tests</name> <type>package</type>
<property>developmentPrerequisites</property> <value>#(#(#any 'Battlesnake' '') #(#any 'Battlesnake-Snakesonaplane' '') #(#any 'SUnit' '') #(#any 'SUnitToo' ''))</value>
</component-property>

<component-property>
<name>Battlesnake-Tests</name> <type>package</type>
<property>prerequisiteDescriptions</property> <value>#(#(#name 'Battlesnake' #componentType #package) #(#name 'Battlesnake-Snakesonaplane' #componentType #package) #(#name 'SUnit' #componentType #package) #(#name 'SUnitToo' #componentType #package))</value>
</component-property>

<class>
<name>GameTest</name>
<environment>Battlesnake</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>host port </inst-vars>
<class-inst-vars></class-inst-vars>
<imports>
			private Net.*
			private SiouX.*
			private Xtreams.*
			</imports>
<category></category>
<attributes>
<package>Battlesnake-Tests</package>
</attributes>
</class>

<class>
<name>BoardTest</name>
<environment>Battlesnake</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake-Tests</package>
</attributes>
</class>

<class>
<name>BattlesnakeTest</name>
<environment>Battlesnake</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake-Tests</package>
</attributes>
</class>

<class>
<name>SnakeTest</name>
<environment>Battlesnake</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>board snake </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake-Tests</package>
</attributes>
</class>

<class>
<name>TestObstacle</name>
<environment>Battlesnake</environment>
<super>Battlesnake.TileContent</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake-Tests</package>
</attributes>
</class>

<methods>
<class-id>Battlesnake.GameTest</class-id> <category>accessing</category>

<body package="Battlesnake-Tests" selector="hostPortString">hostPortString	^ host, ':', port printString</body>

<body package="Battlesnake-Tests" selector="urlString:">urlString: path	^ 'http://', self hostPortString, path</body>
</methods>

<methods>
<class-id>Battlesnake.GameTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="newGameState">newGameState		^ Dictionary		with: #game_id -&gt; 'test-game'		with: #width -&gt; 20		with: #height -&gt; 20</body>

<body package="Battlesnake-Tests" selector="testPostEnd">testPostEnd	| request response state decoded |	state := self newGameState.	request := Net.HttpRequest get: (self urlString: '/end').	state keysAndValuesDo: [ :key :value | request addFormKey: key value: (JSON encode: value) ].	response := request execute.		self assert: response notNil.	self assert: response isSuccess.	self assert: response contentType = 'application/json'.	decoded := JSON decode: response contents.	self assert: decoded notNil.	self assert: decoded keys sorted = #(color head_url name taunt)</body>

<body package="Battlesnake-Tests" selector="moveState">moveState	^ Game exampleGame		turn: 5;			state.</body>

<body package="Battlesnake-Tests" selector="testPostStart">testPostStart	| request response state decoded |	state := self newGameState.	request := Net.HttpRequest post: (self urlString: '/start').	state keysAndValuesDo: [ :key :value | request addFormKey: key value: (JSON encode: value) ].	response := request execute.		self assert: response notNil.	self assert: response isSuccess.	self assert: response contentType = 'application/json'.	decoded := JSON decode: response contents.	self assert: decoded notNil.	self assert: decoded keys sorted = #(color head_url name taunt)</body>

<body package="Battlesnake-Tests" selector="testGameCreation">testGameCreation	| game state |	state := self newGameState.	game := Game fromState: state.		self assert: game medusa class == Medusa.	self assert: game board isEmpty.	self assert: game gameName = (state at: #game_id).	self assert: game board width = (state at: #width).	self assert: game board height = (state at: #height).	self assert: game medusa power = 0.	self assert: game medusa head isNil</body>

<body package="Battlesnake-Tests" selector="testGetIndex">testGetIndex	| response |	response := HttpClient get: (self urlString: '/').		self assert: response notNil.	self assert: response code = '200'.	self assert: (response contents beginsWith: '&lt;a href="https://github.com/JerryKott/battlesnake"&gt;Medusa&lt;/a&gt;').</body>

<body package="Battlesnake-Tests" selector="testPostMove">testPostMove	| request response state decoded |	state := self moveState.	request := Net.HttpRequest post: (self urlString: '/move').	state keysAndValuesDo: [ :key :value | request addFormKey: key value: (JSON encode: value) ].	response := request execute.		self assert: response notNil.	self assert: response isSuccess.	self assert: response contentType = 'application/json'.	decoded := JSON decode: response contents.	self assert: decoded notNil.	self assert: decoded keys sorted = #(color head_url name taunt)</body>
</methods>

<methods>
<class-id>Battlesnake.GameTest</class-id> <category>initialize-release</category>

<body package="Battlesnake-Tests" selector="setUp">setUp	| server |	super setUp.	server := SiouX.Server id: 'Battlesnake Server'.	server start.	host := 'localhost'.	port := server listeners first port.</body>
</methods>


<methods>
<class-id>Battlesnake.BoardTest</class-id> <category>testing</category>

<body package="Battlesnake-Tests" selector="testExampleBoard">testExampleBoard	| board |		board := Board exampleBoard.		self assert: board snakes notEmpty.	self assert: board foods notEmpty.</body>

<body package="Battlesnake-Tests" selector="testSimplePath">testSimplePath	|myBoard path start end |		myBoard:= Board defaultBoard.		(Array		with: ((2 @ 3) corner: (7 @ 7))		with: ((10 @ 15) corner: (7 @ 7))		with: ((2 @ 15) corner: (7 @ 7))		with: ((10 @ 3) corner: (7 @ 7))) do: [ :rectangle |			start := myBoard at: rectangle origin.			end := myBoard at: rectangle corner.			path := start simplePathTo: end.			self assert: path size = (start distanceTo: end)						]</body>

<body package="Battlesnake-Tests" selector="testInsideNeighbours">testInsideNeighbours	| board dimensions tile |	dimensions := 20 @ 20.	board := Board width: dimensions x height: dimensions y.		1 to: dimensions x - 2 do: [ :x |		1 to: dimensions y - 2 do: [ :y |			tile := board at: x @ y.			self assert: tile neighbours size = 4.			self assert: tile north south == tile.			self assert: tile east west == tile.			self assert: tile south north == tile.			self assert: tile west east == tile.			self assert: tile north east south west == tile.			self assert: tile north west south east == tile.			self assert: tile south east north west == tile.			self assert: tile south west north east == tile.			]		]</body>

<body package="Battlesnake-Tests" selector="testBestPath">testBestPath	| board path time |	board := Board defaultBoard.		time := [path := board topLeft findPathTo: board bottomLeft] timeToRun.	"The following assertion will fail if the above code is interrupted by a breakpoint etc."	self assert: time &lt; 100 milliseconds.	self assert: path notNil.	self assert: path size = (board height - 1).	self assert: path last == board bottomLeft.		path := board topLeft findPathTo: board bottomRight.	self assert: path notNil.	self assert: path size = (board height + board width - 2).	self assert: path last == board bottomRight.	self assert: (path allSatisfy: [:eachTile | eachTile isEmpty])</body>

<body package="Battlesnake-Tests" selector="testCorners">testCorners	| board dimensions tile neighbor |	board := Board defaultBoard.	dimensions := board dimensions.		"Test upper-left tile:"	tile := board at: 0@0.	self assert: tile north isNil.	self assert: tile west isNil.	neighbor := tile east.	self assert: neighbor notNil.	self assert: neighbor west == tile.	neighbor := tile south.	self assert: neighbor notNil.	self assert: neighbor north == tile.		"Test upper-right tile:"	tile := board at: (dimensions x - 1) @ 0.	self assert: tile north isNil.	self assert: tile east isNil.	neighbor := tile west.	self assert: neighbor notNil.	self assert: neighbor east == tile.	neighbor := tile south.	self assert: neighbor notNil.	self assert: neighbor north == tile.		"Test bottom-right tile:"	tile := board at: (dimensions x - 1) @ (dimensions y - 1).	neighbor := tile north.		self assert: neighbor notNil.	self assert: neighbor south == tile.	self assert: tile east isNil.	neighbor := tile west.	self assert: neighbor notNil.	self assert: neighbor east == tile.	self assert: tile south isNil.	"Test bottom-left tile:"	tile := board at: 0 @ (dimensions y - 1).	neighbor := tile north.		self assert: neighbor notNil.	self assert: neighbor south == tile.	self assert: tile west isNil.	neighbor := tile east.	self assert: neighbor notNil.	self assert: neighbor west == tile.	self assert: tile south isNil.</body>

<body package="Battlesnake-Tests" selector="testNodeDistances">testNodeDistances	| board size startNode endNode |	size := 20 @ 20.	board := Board width: size x height: size y.	startNode := PathNode on: (board at: 0 @ 0).	endNode := PathNode on: (board at: (size x - 1) @ (size y - 1)).		self assert: (startNode distanceTo: endNode) = (size x + size y - 2)</body>

<body package="Battlesnake-Tests" selector="testBestPathWithObstacles">testBestPathWithObstacles	| board path time |	board := Board defaultBoard.	board		putTestObstacleAt: 0 @ 5;		putTestObstacleAt: 1 @ 5;		putTestObstacleAt: 2 @ 5;		putTestObstacleAt: 3 @ 5;		putTestObstacleAt: 10 @ 4;		putTestObstacleAt: 10 @ 5;		putTestObstacleAt: 10 @ 6;		putTestObstacleAt: 19 @ 15;		putTestObstacleAt: 18 @ 15;		putTestObstacleAt: 17 @ 15;		putTestObstacleAt: 16 @ 15;		putTestObstacleAt: 15 @ 15;		putTestObstacleAt: 14 @ 15;		putTestObstacleAt: 14 @ 16;		putTestObstacleAt: 17 @ 19;		putTestObstacleAt: 17 @ 18;		putTestObstacleAt: 17 @ 17.		time := [path := board topLeft findPathTo: board bottomRight] timeToRun.	self assert: time &lt; 100 milliseconds.	self assert: path last == board bottomRight.	path := board topRight findPathTo: board bottomRight.	self assert: path last == board bottomRight.	path := board topRight findPathTo: board bottomLeft.	self assert: path last == board bottomLeft.	path := board topLeft findPathTo: board bottomLeft.	self assert: path last == board bottomLeft.</body>
</methods>


<methods>
<class-id>Battlesnake.BattlesnakeTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="testJakeSnake">testJakeSnake</body>
</methods>

<methods>
<class-id>Battlesnake.BattlesnakeTest</class-id> <category>running</category>

<body package="Battlesnake-Tests" selector="startData">startData	^ Dictionary new		at: #game_id put: 'hairy-cheese';		at: #width put: 20;		at: #height put: 20;		yourself</body>

<body package="Battlesnake-Tests" selector="boardStateData">boardStateData	"	https://github.com/sendwithus/battlesnake-legacy#board-state-objects	self new boardStateData"	" Start with empty board."	| board |	board := Board width: 20 height: 20.	" Put some food on the grid. "	#(#(2 3) #(3 7) #(3 19) #(5 5) #(12 4) #(16 13))		do: [:coordinates | board putFoodAt: coordinates first @ coordinates last].	" Put some snakes on the grid. "	board addSnake: (Snake exampleOn: board).	board addSnake: (Snake exampleNoodlezOn: board).	^board</body>

<body package="Battlesnake-Tests" selector="runTest:">runTest: aReceiver	| startData |		startData := Dictionary new</body>
</methods>


<methods>
<class-id>Battlesnake.SnakeTest</class-id> <category>initialize-release</category>

<body package="Battlesnake-Tests" selector="setUp">setUp	super setUp.	board := Board defaultBoard</body>

<body package="Battlesnake-Tests" selector="tearDown">tearDown	board := nil.	^ super tearDown</body>
</methods>

<methods>
<class-id>Battlesnake.SnakeTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="testNewSnake">testNewSnake	| head |	snake := Snake on: board.	self assert: snake head isNil.	self assert: snake segments isEmpty.	self assert: snake tail isNil.		snake coordinates: #(#(3, 5)).		head := snake head.	self assert: head notNil.	self assert: head class == Head.	self assert: head isSnakePart.	self assert: head isSnakeHead. 	self assert: head tile position = (3 @ 5).	self assert: snake power = 1.	self assert: snake tail == head.	self assert: head tailLength = 0</body>

<body package="Battlesnake-Tests" selector="testMedusaBubble">testMedusaBubble	| coordinates bubble bubbleShift |	coordinates := #(#(3 5) #(3 6) #(3 7) #(4 7)).	snake := Medusa on: board.	snake coordinates: coordinates.	bubble := snake bubble.	self assert: bubble size &gt; 0.		bubbleShift := snake bubbleShift.	self assert: bubbleShift class == Point.	self assert: (bubbleShift x between: -1 and: 1).	self assert: (bubbleShift y between: -1 and: 1).</body>

<body package="Battlesnake-Tests" selector="testSnakeBody">testSnakeBody	| coordinates head count tail |	coordinates := #(#(3 5) #(3 6) #(3 7) #(4 7)).	snake := Snake on: board.	snake coordinates: coordinates.	head := snake head.	tail := snake tail.		self assert: head notNil.	self assert: head class == Head.	self assert: head isSnakePart.	self assert: head isSnakeHead.	self assert: head isSnakeBody not.	self assert: head position = (coordinates first first @ coordinates first last).	self assert: snake power = coordinates size.	count := 0.		snake segments with: coordinates do: [ :segment :coord |		count := count + 1.		self assert: segment position = (coord first @ coord last).		self assert: segment tailLength = (snake power - count).		].		self assert: tail ~~ head.	self assert: tail position = (coordinates last first @ coordinates last last).	self assert: tail class == Body.	self assert: tail isSnakePart.	self assert: tail isSnakeBody.	self assert: tail isSnakeHead not.	self assert: tail tailLength = 0.</body>
</methods>


<methods>
<class-id>Battlesnake.TestObstacle</class-id> <category>accessing state</category>

<body package="Battlesnake-Tests" selector="stateDescription">stateDescription		^ 'obstacle'</body>
</methods>


<methods>
<class-id>Battlesnake.Board class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleBoard">exampleBoard"	Answer a board populated with some food and snakes.	(self exampleBoard)"	| board |		board := self defaultBoard.	"Put a bunch of snakes on board"		(Snake exampleSnakes: board) do: [ :eachSnake | board addSnake: eachSnake].		"Add some foods here"	Food exampleCoordinates do: [ :eachPoint | board putFoodAt: eachPoint ].		^ board</body>
</methods>


<methods>
<class-id>Battlesnake.Board</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="putTestObstacleAt:">putTestObstacleAt: aPoint	| tile obstacle |	obstacle := TestObstacle new.	tile := self at: aPoint.	tile content: obstacle.	obstacle tile: tile.</body>
</methods>


<methods>
<class-id>Battlesnake.Snake class</class-id> <category>example snakes</category>

<body package="Battlesnake-Tests" selector="exampleEnemy1_on:">exampleEnemy1_on: aBoard"	self exampleEnemy1_on: Board defaultBoard"	^(self on: aBoard)		snakeName: 'Enemy 1';		coordinates: #(#(10 12) #(10 13) #(10 14) #(10 15));		yourself</body>

<body package="Battlesnake-Tests" selector="exampleOn:">exampleOn: aBoard	"	self exampleOn: Board defaultBoard"	^(self on: aBoard)		snakeName: 'example-snake';		coordinates: #(#(4 6) #(4 7) #(4 8) #(5 8) #(6 8));		yourself</body>

<body package="Battlesnake-Tests" selector="exampleEnemy2_on:">exampleEnemy2_on: aBoard"	self exampleEnemy2_on: Board defaultBoard"	^(self on: aBoard)		snakeName: 'Enemy 2';		coordinates: #(#(11 5) #(11 4) #(10 4) #(10 3) #(10 2) #(11 2) #(12 2) #(13 2));		yourself</body>

<body package="Battlesnake-Tests" selector="exampleMedusaOn:">exampleMedusaOn: aBoard"	self exampleMedusaOn: Board defaultBoard"	^(Medusa on: aBoard)		snakeName: 'Medusa';		coordinates: #(#(7 8) #(6 8 ) #(5 8) #(5 9) #(5 10) #(4 10));		yourself</body>

<body package="Battlesnake-Tests" selector="exampleSnakes:">exampleSnakes: aBoard	^ Set new		add: (self exampleMedusaOn: aBoard);		add: (self exampleEnemy1_on: aBoard);		add: (self exampleEnemy2_on: aBoard);		yourself</body>

<body package="Battlesnake-Tests" selector="exampleNoodlezOn:">exampleNoodlezOn: aBoard	"	self exampleNoodlezOn: Board defaultBoard"	^(self on: aBoard)		snakeName: 'Noodlez';		coordinates: #(#(0 0) #(0 1) #(0 2) #(1 2));		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.Game class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleGame">exampleGame"	(self exampleGame)"	^ self new		gameName: 'Example Game';		board: Board exampleBoard;		turn: 0;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.Food class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleCoordinates">exampleCoordinates"	Return an Array of Points with the coordinates of food."	^ #(#(2 2) #(13 5) #(16 12) #(7 16 ) #(16 16)) collect: [ :each | each first @ each last]</body>
</methods>



</st-source>
