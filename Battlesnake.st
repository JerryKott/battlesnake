<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks®, Pre-Release 8.2 (feb16.1) of 5 February, 2016 on 18 February, 2016 at 6:41:52 PM</time-stamp>


<component-created>
<name>Battlesnake</name> <type>package</type>
</component-created><!-- Package Battlesnake(0.0.23,jkott)= -->


<component-property>
<name>Battlesnake</name> <type>package</type>
<property>prerequisiteParcels</property> <value>#(#('SiouX-Server' '') #('Xtreams-Transforms' '') #('AppeX-Core' '') #('SiouX-Tools' '') #('AppeX-Tools' ''))</value>
</component-property>

<component-property>
<name>Battlesnake</name> <type>package</type>
<property>developmentPrerequisites</property> <value>#(#(#any 'SiouX-Server' '') #(#any 'Xtreams-Transforms' '') #(#any 'AppeX-Core' '') #(#any 'SiouX-Tools' '') #(#any 'AppeX-Tools' ''))</value>
</component-property>

<component-property>
<name>Battlesnake</name> <type>package</type>
<property>prerequisiteDescriptions</property> <value>#(#(#name 'SiouX-Server' #componentType #bundle) #(#name 'Xtreams-Transforms' #componentType #package) #(#name 'AppeX-Core' #componentType #package) #(#name 'SiouX-Tools' #componentType #package) #(#name 'AppeX-Tools' #componentType #bundle))</value>
</component-property>

<name-space>
<name>Battlesnake</name>
<environment>Smalltalk</environment>
<private>false</private>
<imports>
			private Core.*
			</imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</name-space>

<class>
<name>TileContent</name>
<environment>Battlesnake</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>tile </inst-vars>
<class-inst-vars></class-inst-vars>
<imports>
			Xtreams.*
			</imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>SnakePart</name>
<environment>Battlesnake</environment>
<super>Battlesnake.TileContent</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>snake nextSegment </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>Head</name>
<environment>Battlesnake</environment>
<super>Battlesnake.SnakePart</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>PathNode</name>
<environment>Battlesnake</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>tile gCost hCost parentNode distanceFromStart </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>TileStateChanged</name>
<environment>Battlesnake</environment>
<super>Core.Announcement</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>tile </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>Snake</name>
<environment>Battlesnake</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>head snakeName board segments liveStatus score color headUrl </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<comment>
<class-id>Battlesnake.Snake</class-id>
<body>Snake has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.Instance Variables:	board	&lt;AlphaCompositedImage | Board | FlowLine | FlowParagraph | FlowSegment | GraphicsMedium | Grid | Label | LayoutSizedOrigin | OrderedDither | PixelArray | RasterOp | Rectangle | SimpleStringLabel | TextLines | WindowOpenPositionToolModel&gt;	description of board	bubble	&lt;Collection&gt;	description of bubble	head	&lt;AbstractBinaryObjectStorage | BoardTile | ByteCodeStream | DatabaseField | EncodedStream | GenericSettingDescriptor | MenuItem | MenuItemInsertion | NullStream | PathNode | PositionableStream | PostgresLOB | ProgressWidgetSpec | RBErrorAction | ReadStream | RectangleEdge | SettingsManagerPage | StandardIOStream | SyntaxErrorException | TextCollector | TileContent | UnsupportedCharacterError | WriteStream&gt;	description of head	segments	&lt;SequenceableCollection&gt;	description of segments	snakeName	&lt;JavascriptCode | MessageForwarder | Object | ProtoObject | ProtoObject&gt;	description of snakeNameStrategy:1) Receive board state2) Parse the board for food and snakes (boardtile with boardtile contents, and snake objects)3) Slither:Do I have a path?	ifTrue:[		Has the path changed?		ifTrue:[Snake findPathTo: (Snake findTarget).]					]	ifFalse:[Snake findPathTo: (Snake findTarget).	]	Snake move - moves to first tile in path instance variable, and decreases path to move first tile.Method: slither - returns selfMethod: findTarget - returns a tile	calls methods:	- findFoodTile - returns foodTile or nil	- findSmallsnakeTile - returns tile or nil	- runAwayFrom:aTile - returns safetyTile or nil	- findPerimeter - return clear wall tile on farthest wall (if width is &gt; 50% of width of board) or nearest wall (remember bubble tiles!)Method: findPathTo: aTile -- returns a pathMethod: snake move -- returns selfInstance variable: addWiggle(boolean) - adds additional tiles to your path</body>
</comment>

<class>
<name>Game</name>
<environment>Battlesnake</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>board medusa gameName turn </inst-vars>
<class-inst-vars></class-inst-vars>
<imports>
			Xtreams
			</imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>BoardTile</name>
<environment>Battlesnake</environment>
<super>Core.Announcer</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>north east south west neighbours position content board </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>Medusa</name>
<environment>Battlesnake</environment>
<super>Battlesnake.Snake</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>strategies path bubble target </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<comment>
<class-id>Battlesnake.Medusa</class-id>
<body>Medusa has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.Instance Variables:	path	&lt;OrderedCollection of &lt;Tile&gt;&gt;	path I am about to take.	strategies	&lt;OrderedCollection&gt;	collection of blocks that when evaluated, will determine the next behaviour.</body>
</comment>

<class>
<name>Board</name>
<environment>Battlesnake</environment>
<super>Core.Announcer</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>rows snakes foods </inst-vars>
<class-inst-vars></class-inst-vars>
<imports>
			Xtreams.*
			</imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>Body</name>
<environment>Battlesnake</environment>
<super>Battlesnake.SnakePart</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>previousSegment </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>WormHole</name>
<environment>Battlesnake</environment>
<super>AppeX.Application</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>activeGame </class-inst-vars>
<imports>
			private OS.*
			private Xtreams.*
			</imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<class>
<name>Food</name>
<environment>Battlesnake</environment>
<super>Battlesnake.TileContent</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Battlesnake</package>
</attributes>
</class>

<methods>
<class-id>Battlesnake.BoardTile class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:at:">on: aBoard at: aPosition	^ self new		board: aBoard;		position: aPosition;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>accessing</category>

<body package="Battlesnake" selector="x">x	^ position x</body>

<body package="Battlesnake" selector="west">west	^west</body>

<body package="Battlesnake" selector="east">east	^east</body>

<body package="Battlesnake" selector="position">position	^position</body>

<body package="Battlesnake" selector="tile">tile"	For polymorphic use of certain methods, I implement tile to return self."	^ self</body>

<body package="Battlesnake" selector="east:">east: aTile	east == aTile ifTrue: [^self].	east := aTile.	aTile west: self</body>

<body package="Battlesnake" selector="highPassingCost">highPassingCost"	Answer a high number representing basically a non-passable content."	^ 16rFFFFFFF</body>

<body package="Battlesnake" selector="board:">board: anObject	board := anObject</body>

<body package="Battlesnake" selector="south:">south: aTile	south == aTile ifTrue: [ ^ self ].	south := aTile.	aTile north: self</body>

<body package="Battlesnake" selector="probableCostIn:for:">probableCostIn: numberOfMoves for: aMedusa	| cost |	cost := 0.		self board snakes do: [ :eachSnake |		eachSnake == aMedusa ifFalse: [			(eachSnake head distanceTo: self) &lt; numberOfMoves ifTrue: [				]			].		].		cost</body>

<body package="Battlesnake" selector="y">y	^ position y</body>

<body package="Battlesnake" selector="south">south	^south</body>

<body package="Battlesnake" selector="north:">north: aTile	north == aTile ifTrue: [ ^ self ].	north := aTile.	aTile south: self</body>

<body package="Battlesnake" selector="neighbours">neighbours	^ neighbours ifNil: [ neighbours := (Set new: 4)		add: north;		add: east;		add: south;		add: west;		yourself]</body>

<body package="Battlesnake" selector="content">content		^ content</body>

<body package="Battlesnake" selector="content:">content: aTileContent	content == aTileContent ifTrue: [ ^ self ].	content ifNotNil: [		content isFood ifTrue: [ board removeFood: content ].		content tile: nil.		].	content := aTileContent.	content ifNotNil: [ content tile: self ].	self announce: (TileStateChanged on: self)</body>

<body package="Battlesnake" selector="position:">position: aPoint	position := aPoint</body>

<body package="Battlesnake" selector="snake">snake	^ content ifNotNil: [ content snake ]</body>

<body package="Battlesnake" selector="west:">west: aTile	west == aTile ifTrue: [ ^ self ].	west := aTile.	aTile east: self</body>

<body package="Battlesnake" selector="board">board	^board</body>

<body package="Battlesnake" selector="passingCostIn:for:">passingCostIn: numberOfMoves for: aMedusa	self isTraversable ifTrue: [ ^ 0 ].	"Actually, this should be a probabilistic function of the distance of other snakes on board. "		"content must be a SnakePart. Determine its tailLength, and whether it's shorter than numberOfMoves."		^ (content tailLength &lt; numberOfMoves)		ifTrue: [ 0 ]		ifFalse: [ self highPassingCost ]</body>

<body package="Battlesnake" selector="north">north	^north</body>

<body package="Battlesnake" selector="neighbourAt:">neighbourAt: offset	offset = (-1 @ 0) ifTrue: [^ west].	offset = (1 @ 0) ifTrue: [^ east].	offset = (0 @ -1) ifTrue: [^ north].	offset = (0 @ 1) ifTrue: [^ south].	^ nil</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>testing</category>

<body package="Battlesnake" selector="isEmpty">isEmpty	^ content isNil</body>

<body package="Battlesnake" selector="isTraversable">isTraversable	^ self isEmpty or: [content isObstacle not ]</body>

<body package="Battlesnake" selector="hasFood">hasFood	^ content notNil and: [ content isFood ]</body>

<body package="Battlesnake" selector="isOccupiedBySnake">isOccupiedBySnake	^ content notNil and: [ content isSnakePart ]</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>finding items</category>

<body package="Battlesnake" selector="closestSnake">closestSnake	^ self		closestOf: board snakes		sortedBy: [ :eachSnake | self distanceTo: eachSnake ]</body>

<body package="Battlesnake" selector="closestEdgeTile">closestEdgeTile	| corner rectangle |	corner := self closestCorner.	rectangle :=self position corner: corner position.		^ rectangle width abs &gt;= rectangle height abs		ifTrue: [board at: self x @ corner y ]		ifFalse: [board at: corner x @ self y ].</body>

<body package="Battlesnake" selector="farthestEdgeTile">farthestEdgeTile	| corner rectangle |	corner := self farthestCorner.	rectangle :=self position corner: corner position.		^ rectangle width abs &lt; rectangle height abs		ifTrue: [board at: self x @ corner y ]		ifFalse: [board at: corner x @ self y ].</body>

<body package="Battlesnake" selector="closestSnakeByPath">closestSnakeByPath	^ self		closestOf: board snakes		sortedBy: [ :eachSnake | self pathDistanceTo: eachSnake ]</body>

<body package="Battlesnake" selector="closestOf:sortedBy:">closestOf: items sortedBy: aBlock"	Answer the closest of the items where aBlock determines which distance we use."	items isEmpty ifTrue: [ ^ nil ].		^ (board sortItems: items by: aBlock) first</body>

<body package="Battlesnake" selector="closestCornerByPath">closestCornerByPath	^ self		closestOf: board cornerTiles		sortedBy: [ :eachTile | self pathDistanceTo: eachTile ]</body>

<body package="Battlesnake" selector="closestCorner">closestCorner	^ self		closestOf: board cornerTiles		sortedBy: [ :eachTile | self distanceTo: eachTile ]</body>

<body package="Battlesnake" selector="farthestOf:sortedBy:">farthestOf: items sortedBy: aBlock"	Answer the farthest of the items where aBlock determines which distance we use."	items isEmpty ifTrue: [ ^ nil ].		^ (board sortItems: items by: aBlock) last</body>

<body package="Battlesnake" selector="farthestCorner">farthestCorner	^ self		farthestOf: board cornerTiles		sortedBy: [ :eachTile | self distanceTo: eachTile ]</body>

<body package="Battlesnake" selector="closestFood">closestFood	^ self		closestOf: board foods		sortedBy: [ :eachFood | self distanceTo: eachFood ]</body>

<body package="Battlesnake" selector="closestFoodByPath">closestFoodByPath	^ self		closestOf: board foods		sortedBy: [ :eachFood | self pathDistanceTo: eachFood ]</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>path finding</category>

<body package="Battlesnake" selector="findPathTo:">findPathTo: targetTile"	Answer a collection of tiles leading to the targetTile. Do not include myself in the path.	OPEN - the set of nodes to be evaluated	CLOSED - set of nodes already evaluated	add the start node (representing myself) to the OPEN set"	| open closed nodes path current neighbourAtTile updateCosts updateNodeAtTile  currentNeighbours |		open := SortedCollection sortBlock: [ :a :b | a fCost &lt;= b fCost ].	closed := Set new.	nodes := IdentityDictionary new. "Keep a map between tiles and nodes so the nodes can be revisited."	path := OrderedCollection new.	updateCosts := [ :node |		node targetDistance: (targetTile position - node tile position) battlesnakeDistance.		(open includes: node) ifTrue: [ open reSort ].		].		neighbourAtTile := [ :tile |		nodes at: tile ifAbsentPut: [			| node |			node := PathNode on: tile.			updateCosts value: node.			node			]		].		updateNodeAtTile := [ :tile |		| node |		node := neighbourAtTile value: tile.		updateCosts value: node.		node		].		current := updateNodeAtTile value: self.	open add: current.		"	loop		current = node in OPEN with the lowest f_cost		remove current from OPEN		add current to CLOSED			"	[open isEmpty] whileFalse: [		current := open removeFirst.		closed add: current.		"		if current is the target node			return				"		current tile == targetTile ifTrue: [			[ current notNil ] whileTrue: [				path add: current.				current := current parentNode.				].			^ (path reverse collect: #tile)				removeFirst;	"That's me!"				yourself			].		"		for each neighbour of the current node			if neighbour is in CLOSED or neighbour is not traversable				skip to the next neighbour		"		currentNeighbours := current tile neighbours sorted: [ :a :b |			(targetTile position - a position) battlesnakeDistance &lt;= (targetTile position - b position) battlesnakeDistance			].		currentNeighbours do: [ :eachNeighbour |			| node |			node := neighbourAtTile value: eachNeighbour.			 ((closed includes: node) or: [ eachNeighbour isTraversable not]) ifFalse: [				"				if new path to neighbour is shorter or neighbour is not in OPEN					set fCost of neighbour					set parent of neighbour to current					if neighbour is not in OPEN						add neighbour to OPEN				"				| oldGCost newGCost notInOpen|								oldGCost := node gCost.				updateCosts value: node.				newGCost := node gCost.				notInOpen := (open includes: node) not.				(newGCost &lt; oldGCost or: [ notInOpen]) ifTrue: [					node   parentNode: current.					notInOpen ifTrue: [						open add: node.						]					]				]			]		].	"If I got here there is no path to targetTile. Return nil."	^ nil</body>

<body package="Battlesnake" selector="simplePathTo:">simplePathTo: targetTile"	Find which of the x,y deltas is larger, and add nodes along that axis before adding nodes along the other axis."	| path rectangle long short current corner |		path := OrderedCollection new: (self distanceTo: targetTile) + 1.	rectangle := self position corner: targetTile position.	rectangle width abs &gt;= rectangle height abs		ifTrue: [			long := rectangle width @ 0.			short := 0 @ rectangle height ]		ifFalse: [			short := rectangle width @ 0.			long := 0 @ rectangle height ].	corner := self position + long.	long := long x sign @ long y sign.	short := short x sign @ short y sign.	current := self.	(Array with: corner -&gt; long with: targetTile position -&gt; short) do: [ :cornerOffset |		| nextCorner offset |		nextCorner := cornerOffset key.		offset := cornerOffset value.		[ current position = nextCorner ] whileFalse: [			current := current neighbourAt: offset.			path add: current]		].	^path</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	^self</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>measuring</category>

<body package="Battlesnake" selector="areaWithinDistance:">areaWithinDistance: distance"	Answer the number of tiles possible occupied within distance.	The number of unique tiles that has a NY distance given by distance.	Examples:		BoardTile new areaWithinDistance: 1.		BoardTile new areaWithinDistance: 2.		BoardTile new areaWithinDistance: 3.		BoardTile new areaWithinDistance: 10."	^ 2 * distance * (distance + 1)</body>

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance""	| xMin xMax yMin yMax tiles  |		tiles := Set new: (self areaWithinDistance: distance).		xMin := (position x - distance) max: 0.	xMax := (position x + distance) min: board width - 1.	yMin := (position y - distance) max: 0.	yMax := (position y + distance) min: board height - 1.		xMin to: xMax do: [ :x |		| yFrom yTo xOffset |		xOffset := x - position x.		yFrom := position y - distance + xOffset abs.		yTo := position y + distance - xOffset abs.		yFrom := yFrom max: yMin.		yTo := yTo min: yMax.		yFrom to: yTo do: [ :y |			tiles add: (board at: (x @ y))			]		].		^ tiles</body>

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile	^ (contentOrTile position - self position) battlesnakeDistance</body>

<body package="Battlesnake" selector="pathDistanceTo:">pathDistanceTo: contentOrTile	^ self pathDistanceTo: content using: [self findPathTo: contentOrTile]</body>

<body package="Battlesnake" selector="pathDistanceTo:using:">pathDistanceTo: aTileOrContent using: aBlock	^ (aBlock value: aTileOrContent) ifNotNil: [: path | path size ]</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	aStream nextPutAll: self jsonState</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>converting</category>

<body package="Battlesnake" selector="asDictionary">asDictionary	| dict |	dict := Dictionary new.	dict at: #state put: self state.	self snake ifNotNil: [ dict at: #snake put: self snake snakeName ].		^ dict</body>
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="state">state	| state |		state := Dictionary with: (#xy -&gt; (Array with: self x with: self y)).		content		ifNil: [ state add: #state -&gt; 'empty']		ifNotNil: [ state addAll: content state ].		^ state</body>

<body package="Battlesnake" selector="jsonState">jsonState	^ Game jsonEncode: self state</body>
</methods>


<methods>
<class-id>Battlesnake.TileStateChanged class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aTile	^ self new		tile: aTile;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.TileStateChanged</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile">tile	^tile</body>

<body package="Battlesnake" selector="tile:">tile: anObject	tile := anObject</body>
</methods>


<methods>
<class-id>Battlesnake.TileContent class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aTile	^ self new		tile: aTile;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.TileContent</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile:">tile: anObject	tile := anObject</body>

<body package="Battlesnake" selector="y">y	^ tile y</body>

<body package="Battlesnake" selector="snake">snake	^ nil</body>

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance	^ tile tilesWithinDistance: distance</body>

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile	^ (contentOrTile position - self position) battlesnakeDistance</body>

<body package="Battlesnake" selector="findPathTo:">findPathTo: tileOrContent	^ tile findPathTo: tileOrContent tile</body>

<body package="Battlesnake" selector="tile">tile	^tile</body>

<body package="Battlesnake" selector="neighbours">neighbours	^ tile neighbours</body>

<body package="Battlesnake" selector="position">position	^ tile ifNotNil: [tile position]</body>

<body package="Battlesnake" selector="x">x	^ tile x</body>
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription	^ self subclassResponsibility</body>

<body package="Battlesnake" selector="jsonState">jsonState	^ JSON encode: self state</body>

<body package="Battlesnake" selector="state">state	^ Dictionary with: #state -&gt; self stateDescription</body>
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeBody">isSnakeBody	^ false</body>

<body package="Battlesnake" selector="isSnakePart">isSnakePart	^ false</body>

<body package="Battlesnake" selector="isObstacle">isObstacle	^ true</body>

<body package="Battlesnake" selector="isFood">isFood	^ false</body>

<body package="Battlesnake" selector="isSnakeHead">isSnakeHead	^ false</body>
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	aStream nextPutAll: self jsonState</body>
</methods>


<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>accessing</category>

<body package="Battlesnake" selector="nextSegment:">nextSegment: anObject	nextSegment := anObject</body>

<body package="Battlesnake" selector="nextSegment">nextSegment	^nextSegment</body>

<body package="Battlesnake" selector="snake:">snake: anObject	snake := anObject</body>

<body package="Battlesnake" selector="tailLength">tailLength"	The distance from here to the last segment of the Snake.	This will change every time a segment is appended to the snake."	| tailLength segment |	tailLength := 0.	segment := self.	[(segment := segment nextSegment) isNil] whileFalse: [		tailLength := tailLength + 1.		].	^ tailLength</body>

<body package="Battlesnake" selector="tile:">tile: aTile	super tile: aTile.	snake resetBubble</body>

<body package="Battlesnake" selector="snake">snake	^snake</body>

<body package="Battlesnake" selector="previous">previous	^ nil</body>
</methods>

<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="state">state	^ super state		at: #snake put: snake snakeName;		yourself</body>
</methods>

<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakePart">isSnakePart	^ true</body>
</methods>


<methods>
<class-id>Battlesnake.Body</class-id> <category>accessing</category>

<body package="Battlesnake" selector="previousSegment:">previousSegment: anObject	previousSegment := anObject</body>

<body package="Battlesnake" selector="previousSegment">previousSegment	^previousSegment</body>
</methods>

<methods>
<class-id>Battlesnake.Body</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription	^ 'body'</body>
</methods>

<methods>
<class-id>Battlesnake.Body</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeBody">isSnakeBody	^ true</body>
</methods>


<methods>
<class-id>Battlesnake.PathNode class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="new">new	^ super new initialize</body>

<body package="Battlesnake" selector="on:">on: aTile	^ self new		tile: aTile;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.PathNode</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile">tile	^tile</body>

<body package="Battlesnake" selector="position">position	^ tile position</body>

<body package="Battlesnake" selector="fCost">fCost	^ self gCost + self hCost</body>

<body package="Battlesnake" selector="distanceFromStart">distanceFromStart"	Once a Node has a parentNode, it's distanceFromStart needs to be calculated only once."	^ distanceFromStart ifNil: [		| currentNode |			distanceFromStart := 0.		currentNode := self.		[currentNode notNil] whileTrue: [			distanceFromStart := distanceFromStart + 1.			currentNode := currentNode parentNode			].		distanceFromStart ]</body>

<body package="Battlesnake" selector="targetDistance:">targetDistance: distance"	distance is an Integer representing minimum number of steps to a target."	hCost := distance * self stepCost</body>

<body package="Battlesnake" selector="tile:">tile: anObject	tile := anObject</body>

<body package="Battlesnake" selector="hCost">hCost	^hCost</body>

<body package="Battlesnake" selector="parentNode">parentNode	^parentNode</body>

<body package="Battlesnake" selector="parentNode:">parentNode: anObject	parentNode := anObject</body>

<body package="Battlesnake" selector="distanceTo:">distanceTo: anotherNode	| offset |		offset := (anotherNode position - self position) abs.	"We can only make rectangular moves. If we were able to move diagonally, we'd have to use pythagorean theorem to calculate	the diagonal distances."	^ offset x + offset y</body>

<body package="Battlesnake" selector="stepCost">stepCost"	Answer how much it costs us to make a step. Let's use 100 because it's such a nice round number."	^ 100</body>

<body package="Battlesnake" selector="gCost">gCost"	If it hasn't been calculated yet, determine gCost as the product of my distance from the start of the path	(the first node in the linked list) and a cost associated with a single step."	^gCost ifNil: [ gCost := self distanceFromStart * self stepCost ]</body>
</methods>

<methods>
<class-id>Battlesnake.PathNode</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	super printOn: aStream.	aStream nextPut: $(.	self position printOn: aStream.	aStream nextPut: $).</body>
</methods>

<methods>
<class-id>Battlesnake.PathNode</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize	super initialize.		gCost := hCost := 0.</body>
</methods>


<methods>
<class-id>Battlesnake.Snake class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aBoard	^ self new		board: aBoard;		yourself</body>

<body package="Battlesnake" selector="new">new	^ super new initialize</body>
</methods>


<methods>
<class-id>Battlesnake.Snake</class-id> <category>accessing</category>

<body package="Battlesnake" selector="occupiedTiles">occupiedTiles"	Answer a collection of tiles that my body occupies."	^ self segments collect: #tile</body>

<body package="Battlesnake" selector="power">power	^ self segments size</body>

<body package="Battlesnake" selector="appendBody:">appendBody: aBody	| part |	part := segments last.	part nextSegment: aBody.	aBody previousSegment: part.	aBody snake: self.	segments add: aBody.</body>

<body package="Battlesnake" selector="snakeName:">snakeName: anObject	snakeName := anObject</body>

<body package="Battlesnake" selector="board">board	^board</body>

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance	^ head tilesWithinDistance: distance</body>

<body package="Battlesnake" selector="head:">head: aHead	head := aHead.	aHead snake: self.	segments := OrderedCollection with: head.</body>

<body package="Battlesnake" selector="ensurePartAt:">ensurePartAt: index	| part count |	segments size &gt;= index ifTrue: [^segments at: index].	index = 1		ifTrue: 			[head ifNil: [self head: self newHead].			part := head]		ifFalse: 			[count := 1.			part := head.			[count &lt; index] whileTrue: 					[part nextSegment ifNil: [self appendBody: self newBody].					part := part nextSegment.					count := count + 1]].	^part</body>

<body package="Battlesnake" selector="position">position	^ head position</body>

<body package="Battlesnake" selector="tile">tile"	To ensure polymorphic calculations, we define the tile of a Snake as the tile occupied by its Head."	^ head tile</body>

<body package="Battlesnake" selector="tail">tail	^ head		ifNil: [ nil ]		ifNotNil: [ self segments last ]</body>

<body package="Battlesnake" selector="board:">board: aBoard	board := aBoard</body>

<body package="Battlesnake" selector="snakeName">snakeName	^snakeName</body>

<body package="Battlesnake" selector="coordinates:">coordinates: anArray"	anArray will contain #(x, y) arrays representing the tile on which	individual snake segments lie."	self updateSegmentsFrom: (anArray collect: [ :each | each first @ each last])</body>

<body package="Battlesnake" selector="segments">segments	| answer part |	part := head.	answer := OrderedCollection new.	[ part notNil ] whileTrue: [		answer add: part.		part := part nextSegment.		].	^answer</body>

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile	^ (contentOrTile position - self position) battlesnakeDistance</body>

<body package="Battlesnake" selector="findPathTo:">findPathTo: tileOrContent	^ head findPathTo: tileOrContent tile</body>

<body package="Battlesnake" selector="closestSnake">closestSnake	^ head tile closestSnake</body>

<body package="Battlesnake" selector="head">head	^head</body>

<body package="Battlesnake" selector="newHead">newHead	^Head new</body>

<body package="Battlesnake" selector="closestFood">closestFood	^ head tile closestFood</body>

<body package="Battlesnake" selector="newBody">newBody	^Body new</body>
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>testing</category>

<body package="Battlesnake" selector="canHunt:">canHunt: anotherSnake	^ self power &gt; anotherSnake power</body>

<body package="Battlesnake" selector="shouldRunFrom:">shouldRunFrom: anotherSnake	^ (self canHunt: anotherSnake) not</body>
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>actions</category>

<body package="Battlesnake" selector="updateSegmentsFrom:">updateSegmentsFrom: points""	| length |	length := points size.	1 to: length do: [ :index |		| part |		part := self ensurePartAt: index.		index = length ifTrue: [			part tile ifNotNil: [ :tile | tile contents: nil ]			].		(board at: (points at: index)) content: part]</body>

<body package="Battlesnake" selector="resetBubble">resetBubble"	Ordinary snakes don't have bubble, do nothing."</body>
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize	super initialize.	segments := OrderedCollection new.	liveStatus := 'alive'.	score := 0.	color := "Graphics.ColorValue red" '#ff0000'.	headUrl := 'http://head.some-snake.example/head.png'.</body>
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	aStream nextPutAll: self jsonState</body>
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState	^ Game jsonEncode: self state</body>

<body package="Battlesnake" selector="state">state	^ Dictionary new		at: #name put: self snakeName;		at: #state put: liveStatus;		at: #coords put: (self segments collect: [:each | Array with: each x with: each y]);		at: #score put: score;		at: #color put: color;		at: #head_url put: headUrl;		at: #taunt put: self taunt;		yourself</body>

<body package="Battlesnake" selector="taunt">taunt"	Answer a taunt. This still needs to be implemented."	^'Taunts need to be implemented'</body>
</methods>


<methods>
<class-id>Battlesnake.Game class</class-id> <category>encoding</category>

<body package="Battlesnake" selector="jsonEncode:">jsonEncode: state	^ Xtreams.JSON encode: state</body>
</methods>

<methods>
<class-id>Battlesnake.Game class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="fromState:">fromState: state""	^ self new		board: (Board width: (state at: #width) height: (state at:#height));		gameName: (state at: #game_id);		breedMedusa;		yourself</body>
</methods>


<methods>
<class-id>Battlesnake.Game</class-id> <category>accessing</category>

<body package="Battlesnake" selector="board:">board: aBoard	board := aBoard</body>

<body package="Battlesnake" selector="foods">foods	^board foods</body>

<body package="Battlesnake" selector="gameName">gameName	^gameName</body>

<body package="Battlesnake" selector="medusa">medusa	^medusa</body>

<body package="Battlesnake" selector="snakes">snakes	^ board snakes</body>

<body package="Battlesnake" selector="board">board	^board</body>

<body package="Battlesnake" selector="turn:">turn: anObject	turn := anObject</body>

<body package="Battlesnake" selector="turn">turn	^turn</body>

<body package="Battlesnake" selector="gameName:">gameName: aString	gameName := aString</body>
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState		^ self class jsonEncode: self state</body>

<body package="Battlesnake" selector="state">state	^ Dictionary new		at: #game_id put: gameName;		at: #turn put: turn;		at: #board put: board state;		at: #snakes put: (self snakes collect: #state);		at: #food put: (self foods values collect: [ :eachFood | Array with: eachFood x with: eachFood y]);		yourself</body>
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	aStream nextPutAll: self jsonState</body>
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>actions</category>

<body package="Battlesnake" selector="breedMedusa">breedMedusa	^ medusa := Medusa on: board.</body>
</methods>


<methods>
<class-id>Battlesnake.Head</class-id> <category>accessing</category>

<body package="Battlesnake" selector="areaWithinDistance:">areaWithinDistance: distance	^ tile areaWithinDistance: distance</body>

<body package="Battlesnake" selector="probabilityOfReaching:in:">probabilityOfReaching: aTile in: numberOfMoves"	Answer an integer that is used as the percent probablity that I will reach aTile in numberOfMoves.	This is only determined by the potential size of the area, not by presence of any content in the tiles,"	| distance area |		distance := self distanceTo: aTile.	distance &gt; numberOfMoves ifTrue: [ ^0 ].		area := self areaWithinDistance: distance.		^ (100 / area) rounded</body>
</methods>

<methods>
<class-id>Battlesnake.Head</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription	^ 'head'</body>
</methods>

<methods>
<class-id>Battlesnake.Head</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeHead">isSnakeHead	^ true</body>
</methods>


<methods>
<class-id>Battlesnake.Food</class-id> <category>testing</category>

<body package="Battlesnake" selector="isObstacle">isObstacle	^ false</body>

<body package="Battlesnake" selector="isFood">isFood	^ true</body>
</methods>

<methods>
<class-id>Battlesnake.Food</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription	^ 'food'</body>
</methods>


<methods>
<class-id>Battlesnake.Board class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="width:height:">width: width height: height	^ self new		width: width height: height;		yourself</body>

<body package="Battlesnake" selector="defaultBoard">defaultBoard	^ self width: 20 height: 20</body>
</methods>


<methods>
<class-id>Battlesnake.Board</class-id> <category>accessing</category>

<body package="Battlesnake" selector="foods">foods	^foods</body>

<body package="Battlesnake" selector="topRight">topRight	^ rows first last</body>

<body package="Battlesnake" selector="dimensions">dimensions	^ self width @ self height</body>

<body package="Battlesnake" selector="bottomLeft">bottomLeft	^ rows last first</body>

<body package="Battlesnake" selector="topLeft">topLeft	^ rows first first</body>

<body package="Battlesnake" selector="height">height	^ rows size</body>

<body package="Battlesnake" selector="bottomRight">bottomRight	^ rows last last</body>

<body package="Battlesnake" selector="at:">at: aPoint"	aPoint is a zero-based coordinate of a tile. Adjust indexes to Smalltalk one-based."	^ (rows at: aPoint y + 1) at: aPoint x + 1</body>

<body package="Battlesnake" selector="snakes">snakes	^ snakes</body>

<body package="Battlesnake" selector="cornerTiles">cornerTiles	^ Array		with: self topLeft		with: self topRight		with: self bottomRight		with: self bottomLeft</body>

<body package="Battlesnake" selector="width">width	^ rows any size</body>

<body package="Battlesnake" selector="rows">rows	^rows</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>testing</category>

<body package="Battlesnake" selector="allTiles">allTiles"	(self defaultBoard allTiles)"	^ self rows inject: OrderedCollection new into: [ :tiles :row |		tiles addAll: row;		yourself ]</body>

<body package="Battlesnake" selector="isEmpty">isEmpty	^ self allTiles allSatisfy: [:eachTile | eachTile isEmpty]</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>sorting</category>

<body package="Battlesnake" selector="weakestSnake">weakestSnake	| sorted |		sorted := self snakesByPower.	^ sorted isEmpty		ifTrue: [ nil ]		ifFalse: [ sorted last ]</body>

<body package="Battlesnake" selector="strongestSnake">strongestSnake	| sorted |		sorted := self snakesByPower.	^ sorted isEmpty		ifTrue: [ nil ]		ifFalse: [ sorted first ]</body>

<body package="Battlesnake" selector="snakesByPower">snakesByPower	^ self sortItems: self snakes by: [:eachSnake | eachSnake power]</body>

<body package="Battlesnake" selector="sortItems:by:">sortItems: items by: aBlock"	Answer the closest of the items where aBlock determines which distance we use."	items isEmpty ifTrue: [ ^ #() ].		^ items sorted: [ :a :b | (aBlock value: a) &lt;= (aBlock value: b) ].</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>actions</category>

<body package="Battlesnake" selector="addSnake:">addSnake: aSnake	aSnake segments do: [ :each |		each tile content: each.		].		^ snakes at: aSnake snakeName ifAbsentPut: [aSnake]</body>

<body package="Battlesnake" selector="putFoodAt:">putFoodAt: aPoint	| tile food |	tile := self at: aPoint.	tile hasFood ifTrue: [ ^ self ].	food := Food new.	tile content: food.	foods at: tile put: food.</body>

<body package="Battlesnake" selector="removeFood:">removeFood: aFood	^ foods removeKey: aFood tile</body>

<body package="Battlesnake" selector="removeSnake:">removeSnake: aSnake	aSnake segments do: [ :each |		each tile content: nil.		].		^ snakes removeKey: aSnake ifAbsent: [nil]</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize	super initialize.	snakes := Dictionary new.	foods := Dictionary new</body>

<body package="Battlesnake" selector="width:height:">width: width height: height	rows := Array new: height.	"Create all the Tiles."	1 to: height do: [ :y |		| cells |		cells := Array new: width.		rows at: y put: cells.		1 to: width do: [ :x |			cells at: x put: (BoardTile on: self at: (x - 1) @ (y - 1)).			]		].		"Now link Tiles to become neighbors"	rows inject: nil into: [ :northRow :eachRow |		northRow ifNotNil: [			northRow with: eachRow do: [:northTile :eachTile |				eachTile north: northTile]			].		eachRow inject: nil into: [ :west : tile |			west ifNotNil: [tile west: west].			tile].		eachRow		]</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream	aStream nextPutAll: self jsonState</body>
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState	^ Game jsonEncode: self state</body>

<body package="Battlesnake" selector="state">state"	Answer a collection of objects used to determine my state.	(self defaultBoard state)"	^ self rows collect: [ :eachRow | eachRow collect:#state ]</body>
</methods>


<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>accessing</category>

<body package="Battlesnake" selector="applicationClientClass">applicationClientClass		^ nil</body>

<body package="Battlesnake" selector="activeGame:">activeGame: aGame	activeGame := aGame</body>

<body package="Battlesnake" selector="activeGame">activeGame	^ activeGame</body>
</methods>

<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>battlesnake API</category>

<body package="Battlesnake" selector="start">start	""	&lt;json: 'start'&gt;	&lt;GET&gt;	&lt;POST&gt;	| state |	state := self decodeRequest.	self activeGame: (Game fromState: state).	^self activeGame medusa startResponseState</body>

<body package="Battlesnake" selector="htmlDocument">htmlDocument"	Battlesnake rules specify that GET / returns a string with a link to our source code repository."	&lt;GET&gt;	&lt;plainText: ''&gt;	^ '&lt;a href="https://github.com/JerryKott/battlesnake"&gt;Medusa&lt;/a&gt;&lt;p&gt;This paragraph and the following will need to be removed for the actual game. It is here for testing purposes.&lt;/p&gt;&lt;a href="/start?data=start%20the%20game"&gt;Send a &lt;b&gt;START&lt;/b&gt; request.&lt;/a&gt;&lt;br&gt;&lt;a href="/move?data=send%20us%20your%20board"&gt;Send a &lt;b&gt;MOVE&lt;/b&gt; request.&lt;/a&gt;&lt;br&gt;&lt;a href="/end?data=stop%20the%20game"&gt;Send an &lt;b&gt;END&lt;/b&gt; request.&lt;/a&gt;&lt;br&gt;'</body>

<body package="Battlesnake" selector="move">move""	&lt;json: 'move'&gt;	&lt;GET&gt;	&lt;POST&gt;		| state |	state := self decodeRequest.	^ (Dictionary withAll: state)		add: 'comment' -&gt; 'This is where we will respond with our snake''s next move.';		yourself</body>

<body package="Battlesnake" selector="decodeRequest">decodeRequest	| data formData uri query |	formData := self currentRequestData.	query := formData data first key.	uri := URI fromEncodedString: '/?', query.	data := Dictionary new.	uri queryKeysAndValuesDo: [ :key :value |		| valueString |		valueString := URLEncoder decode: value.		data at: key asSymbol put: (JSON decode: valueString)		].		^ data</body>

<body package="Battlesnake" selector="end">end""	&lt;json: 'end'&gt;	&lt;GET&gt;	&lt;POST&gt;		| formData |	formData := self currentRequestData.			^ (Dictionary withAll: formData data)		add: 'comment' -&gt; 'This is where we will end the game.';		yourself</body>
</methods>

<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>configuration</category>

<body package="Battlesnake" selector="serverConfiguration">serverConfiguration"	Add myself to the Battlesnake Server.	http://localhost:8889/"	&lt;position: 10&gt;	&lt;server: 'Battlesnake Server' path: '/'&gt;</body>
</methods>


<methods>
<class-id>Battlesnake.Medusa</class-id> <category>accessing</category>

<body package="Battlesnake" selector="target:">target: anObject	target := anObject</body>

<body package="Battlesnake" selector="bubble">bubble	^ bubble ifNil: [ bubble := self tilesWithinDistance: self bubbleSize]</body>

<body package="Battlesnake" selector="strategies:">strategies: anObject	strategies := anObject</body>

<body package="Battlesnake" selector="path">path	^path ifNil: [ self findPathToTarget ]</body>

<body package="Battlesnake" selector="bubbleSize">bubbleSize"	I am a Medusa. My bubble size is 3 moves ahead."	^ 3</body>

<body package="Battlesnake" selector="findTarget">findTarget"	Return a Tile or Food (possibly another Snake Head?) based on the current strategy.	For now, just return my tail's neighbor that is not a snake part."	^ self tail neighbours detect: [ :any | any isEmpty ]</body>

<body package="Battlesnake" selector="path:">path: tiles"	Set my path to a collection of Tiles"	path := tiles</body>

<body package="Battlesnake" selector="setNextStrategy">setNextStrategy"	Here is where we determine what out next strategy should be. Until that is finalized,	let's just set the 'find food' strategy is default."	strategies add: [ self findFood ]</body>

<body package="Battlesnake" selector="nextMove">nextMove	| tile |	tile := self path removeFirst.	self loseInterestInTile: tile.	tile == self target tile ifTrue: [		self resetPath; resetTarget.		].	^ tile - head</body>

<body package="Battlesnake" selector="findPathToTarget">findPathToTarget	"	Find the best path to my current target."	| newPath |	newPath := self findPathTo: self target.	newPath do: [:eachTile | self becomeInterestedInTile: eachTile].	^newPath</body>

<body package="Battlesnake" selector="target">target	^target ifNil: [target := self findTarget]</body>

<body package="Battlesnake" selector="strategies">strategies	strategies isEmpty ifTrue: [ self setNextStrategy ].	^strategies</body>

<body package="Battlesnake" selector="bubbleShift">bubbleShift"	Answer a point that should be the direction of the bubble's shift.	All empty tiles have the weight equal to distance from the head.	Tiles with food have larger weight the closer they are to the head."	| sumX sumY sumWeight dX dY shift |		sumX := sumY := sumWeight := 0.		self bubble do: [ :eachTile |		| eachWeight |		eachWeight := 0.		eachTile isEmpty			ifTrue: ["				eachWeight := self distanceTo: eachTile."				eachWeight := 1.				]			ifFalse: [				eachWeight := self bubbleSize + 1 - (self distanceTo: eachTile).			].		eachTile isTraversable ifFalse: [			eachWeight := eachWeight negated.			].		sumX := sumX + (eachTile x * eachWeight).		sumY := sumY + (eachTile y * eachWeight).		sumWeight := sumWeight + eachWeight.		].		dX := (sumX / sumWeight) - head x.	dY := (sumY / sumWeight) - head y.		shift := dX abs &gt; dY abs		ifTrue: [ dX sign @ 0 ]		ifFalse: [ 0 @ dY sign ].				^ shift</body>
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>actions</category>

<body package="Battlesnake" selector="findEnemiesInBubble">findEnemiesInBubble"	Go through my bubble and for each tile that have a snake part in them that is not me, add that snake to the result."	| enemies |		enemies := Set new.	 self bubble do: [ :eachTile | eachTile snake		ifNotNil: [ :snake | snake ~~ self ifTrue: [ enemies add: snake ]]		].		^ enemies</body>

<body package="Battlesnake" selector="findFoodsInBubble">findFoodsInBubble	| foods |		foods := Set new.	 self bubble do: [ :eachTile | eachTile hasFood ifTrue: [ foods add: eachTile content ]		].		^ foods</body>

<body package="Battlesnake" selector="becomeInterestedInTile:">becomeInterestedInTile: aTile	^aTile when: TileStateChanged send: #tileStateChanged: to: self</body>

<body package="Battlesnake" selector="resetTarget">resetTarget	target := nil</body>

<body package="Battlesnake" selector="loseInterestInTile:">loseInterestInTile: eachTile	^eachTile retractInterestIn: TileStateChanged for: self</body>

<body package="Battlesnake" selector="resetPath">resetPath	path ifNotNil: [path do: [:eachTile | self loseInterestInTile: eachTile]].	path := nil</body>

<body package="Battlesnake" selector="resetBubble">resetBubble	bubble := nil</body>
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>strategies</category>

<body package="Battlesnake" selector="findFood">findFood"	This is a placeholder for the 'find food strategy algorithm."</body>

<body package="Battlesnake" selector="huntSnakes">huntSnakes"	This strategy method will implement the snake hunting algorithm."</body>

<body package="Battlesnake" selector="goToPerimeter">goToPerimeter"	This strategy method is a placeholder to go the board perimeter."</body>

<body package="Battlesnake" selector="nextStrategy">nextStrategy"	ANswer a block which, when evaluated, will run the behaviour to plan moves."	^ self strategies removeFirst</body>

<body package="Battlesnake" selector="escapeSnakes">escapeSnakes"	This strategy method will implement the snake escaping algorithm."</body>

<body package="Battlesnake" selector="planStrategy">planStrategy""	self nextStrategy value</body>
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	snakeName := 'Medusa'.	strategies := OrderedCollection new.</body>
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="startResponseState">startResponseState	| state response |	state := self state.		response := #(#name #color #head_url #taunt) collect: [ :each | state associationAt: each ifAbsent: [nil]].		^ Dictionary withAll: response</body>
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>notifications</category>

<body package="Battlesnake" selector="tileStateChanged:">tileStateChanged: anAnnouncement</body>
</methods>


<methods>
<class-id>Core.Point</class-id> <category>accessing</category>

<body package="Battlesnake" selector="battlesnakeDistance">battlesnakeDistance	^ x abs + y abs</body>
</methods>


<methods>
<class-id>SiouX.Server class</class-id> <category>configuration</category>

<body package="Battlesnake" selector="battlesnakeServer:">battlesnakeServer: server	&lt;server: 'Battlesnake Server'&gt;	server listenOn: 8889 for: HttpConnection</body>
</methods>



</st-source>
