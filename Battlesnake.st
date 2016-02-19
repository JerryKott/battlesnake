<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks®, Pre-Release 8.2 (feb16.1) of 5 February, 2016 on 18 February, 2016 at 5:18:38 PM</time-stamp>


<component-created>
<name>Battlesnake</name> <type>package</type>
</component-created><!-- Package Battlesnake(0.0.22,jkott)= -->


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
<body>Snake has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.
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
<body>Medusa has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.
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
			Xtreams.*
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

<body package="Battlesnake" selector="on:at:">on: aBoard at: aPosition
</methods>


<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>accessing</category>

<body package="Battlesnake" selector="x">x

<body package="Battlesnake" selector="west">west

<body package="Battlesnake" selector="east">east

<body package="Battlesnake" selector="position">position

<body package="Battlesnake" selector="tile">tile

<body package="Battlesnake" selector="east:">east: aTile

<body package="Battlesnake" selector="highPassingCost">highPassingCost

<body package="Battlesnake" selector="board:">board: anObject

<body package="Battlesnake" selector="south:">south: aTile

<body package="Battlesnake" selector="probableCostIn:for:">probableCostIn: numberOfMoves for: aMedusa

<body package="Battlesnake" selector="y">y

<body package="Battlesnake" selector="south">south

<body package="Battlesnake" selector="north:">north: aTile

<body package="Battlesnake" selector="neighbours">neighbours

<body package="Battlesnake" selector="content">content

<body package="Battlesnake" selector="content:">content: aTileContent

<body package="Battlesnake" selector="position:">position: aPoint

<body package="Battlesnake" selector="snake">snake

<body package="Battlesnake" selector="west:">west: aTile

<body package="Battlesnake" selector="board">board

<body package="Battlesnake" selector="passingCostIn:for:">passingCostIn: numberOfMoves for: aMedusa

<body package="Battlesnake" selector="north">north

<body package="Battlesnake" selector="neighbourAt:">neighbourAt: offset
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>testing</category>

<body package="Battlesnake" selector="isEmpty">isEmpty

<body package="Battlesnake" selector="isTraversable">isTraversable

<body package="Battlesnake" selector="hasFood">hasFood

<body package="Battlesnake" selector="isOccupiedBySnake">isOccupiedBySnake
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>finding items</category>

<body package="Battlesnake" selector="closestSnake">closestSnake

<body package="Battlesnake" selector="closestEdgeTile">closestEdgeTile

<body package="Battlesnake" selector="farthestEdgeTile">farthestEdgeTile

<body package="Battlesnake" selector="closestSnakeByPath">closestSnakeByPath

<body package="Battlesnake" selector="closestOf:sortedBy:">closestOf: items sortedBy: aBlock

<body package="Battlesnake" selector="closestCornerByPath">closestCornerByPath

<body package="Battlesnake" selector="closestCorner">closestCorner

<body package="Battlesnake" selector="farthestOf:sortedBy:">farthestOf: items sortedBy: aBlock

<body package="Battlesnake" selector="farthestCorner">farthestCorner

<body package="Battlesnake" selector="closestFood">closestFood

<body package="Battlesnake" selector="closestFoodByPath">closestFoodByPath
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>path finding</category>

<body package="Battlesnake" selector="findPathTo:">findPathTo: targetTile

<body package="Battlesnake" selector="simplePathTo:">simplePathTo: targetTile
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>measuring</category>

<body package="Battlesnake" selector="areaWithinDistance:">areaWithinDistance: distance

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile

<body package="Battlesnake" selector="pathDistanceTo:">pathDistanceTo: contentOrTile

<body package="Battlesnake" selector="pathDistanceTo:using:">pathDistanceTo: aTileOrContent using: aBlock
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>converting</category>

<body package="Battlesnake" selector="asDictionary">asDictionary
</methods>

<methods>
<class-id>Battlesnake.BoardTile</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="state">state

<body package="Battlesnake" selector="jsonState">jsonState
</methods>


<methods>
<class-id>Battlesnake.TileStateChanged class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aTile
</methods>


<methods>
<class-id>Battlesnake.TileStateChanged</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile">tile

<body package="Battlesnake" selector="tile:">tile: anObject
</methods>


<methods>
<class-id>Battlesnake.TileContent class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aTile
</methods>


<methods>
<class-id>Battlesnake.TileContent</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile:">tile: anObject

<body package="Battlesnake" selector="y">y

<body package="Battlesnake" selector="snake">snake

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile

<body package="Battlesnake" selector="findPathTo:">findPathTo: tileOrContent

<body package="Battlesnake" selector="tile">tile

<body package="Battlesnake" selector="neighbours">neighbours

<body package="Battlesnake" selector="position">position

<body package="Battlesnake" selector="x">x
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription

<body package="Battlesnake" selector="jsonState">jsonState

<body package="Battlesnake" selector="state">state
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeBody">isSnakeBody

<body package="Battlesnake" selector="isSnakePart">isSnakePart

<body package="Battlesnake" selector="isObstacle">isObstacle

<body package="Battlesnake" selector="isFood">isFood

<body package="Battlesnake" selector="isSnakeHead">isSnakeHead
</methods>

<methods>
<class-id>Battlesnake.TileContent</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>


<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>accessing</category>

<body package="Battlesnake" selector="nextSegment:">nextSegment: anObject

<body package="Battlesnake" selector="nextSegment">nextSegment

<body package="Battlesnake" selector="snake:">snake: anObject

<body package="Battlesnake" selector="tailLength">tailLength

<body package="Battlesnake" selector="tile:">tile: aTile

<body package="Battlesnake" selector="snake">snake

<body package="Battlesnake" selector="previous">previous
</methods>

<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="state">state
</methods>

<methods>
<class-id>Battlesnake.SnakePart</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakePart">isSnakePart
</methods>


<methods>
<class-id>Battlesnake.Body</class-id> <category>accessing</category>

<body package="Battlesnake" selector="previousSegment:">previousSegment: anObject

<body package="Battlesnake" selector="previousSegment">previousSegment
</methods>

<methods>
<class-id>Battlesnake.Body</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription
</methods>

<methods>
<class-id>Battlesnake.Body</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeBody">isSnakeBody
</methods>


<methods>
<class-id>Battlesnake.PathNode class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="new">new

<body package="Battlesnake" selector="on:">on: aTile
</methods>


<methods>
<class-id>Battlesnake.PathNode</class-id> <category>accessing</category>

<body package="Battlesnake" selector="tile">tile

<body package="Battlesnake" selector="position">position

<body package="Battlesnake" selector="fCost">fCost

<body package="Battlesnake" selector="distanceFromStart">distanceFromStart

<body package="Battlesnake" selector="targetDistance:">targetDistance: distance

<body package="Battlesnake" selector="tile:">tile: anObject

<body package="Battlesnake" selector="hCost">hCost

<body package="Battlesnake" selector="parentNode">parentNode

<body package="Battlesnake" selector="parentNode:">parentNode: anObject

<body package="Battlesnake" selector="distanceTo:">distanceTo: anotherNode

<body package="Battlesnake" selector="stepCost">stepCost

<body package="Battlesnake" selector="gCost">gCost
</methods>

<methods>
<class-id>Battlesnake.PathNode</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>

<methods>
<class-id>Battlesnake.PathNode</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize
</methods>


<methods>
<class-id>Battlesnake.Snake class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="on:">on: aBoard

<body package="Battlesnake" selector="new">new
</methods>


<methods>
<class-id>Battlesnake.Snake</class-id> <category>accessing</category>

<body package="Battlesnake" selector="occupiedTiles">occupiedTiles

<body package="Battlesnake" selector="power">power

<body package="Battlesnake" selector="appendBody:">appendBody: aBody

<body package="Battlesnake" selector="snakeName:">snakeName: anObject

<body package="Battlesnake" selector="board">board

<body package="Battlesnake" selector="tilesWithinDistance:">tilesWithinDistance: distance

<body package="Battlesnake" selector="head:">head: aHead

<body package="Battlesnake" selector="ensurePartAt:">ensurePartAt: index

<body package="Battlesnake" selector="position">position

<body package="Battlesnake" selector="tile">tile

<body package="Battlesnake" selector="tail">tail

<body package="Battlesnake" selector="board:">board: aBoard

<body package="Battlesnake" selector="snakeName">snakeName

<body package="Battlesnake" selector="coordinates:">coordinates: anArray

<body package="Battlesnake" selector="segments">segments

<body package="Battlesnake" selector="distanceTo:">distanceTo: contentOrTile

<body package="Battlesnake" selector="findPathTo:">findPathTo: tileOrContent

<body package="Battlesnake" selector="closestSnake">closestSnake

<body package="Battlesnake" selector="head">head

<body package="Battlesnake" selector="newHead">newHead

<body package="Battlesnake" selector="closestFood">closestFood

<body package="Battlesnake" selector="newBody">newBody
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>testing</category>

<body package="Battlesnake" selector="canHunt:">canHunt: anotherSnake

<body package="Battlesnake" selector="shouldRunFrom:">shouldRunFrom: anotherSnake
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>actions</category>

<body package="Battlesnake" selector="updateSegmentsFrom:">updateSegmentsFrom: points

<body package="Battlesnake" selector="resetBubble">resetBubble
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>

<methods>
<class-id>Battlesnake.Snake</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState

<body package="Battlesnake" selector="state">state

<body package="Battlesnake" selector="taunt">taunt
</methods>


<methods>
<class-id>Battlesnake.Game class</class-id> <category>encoding</category>

<body package="Battlesnake" selector="jsonEncode:">jsonEncode: state
</methods>

<methods>
<class-id>Battlesnake.Game class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="fromState:">fromState: state
</methods>


<methods>
<class-id>Battlesnake.Game</class-id> <category>accessing</category>

<body package="Battlesnake" selector="board:">board: aBoard

<body package="Battlesnake" selector="foods">foods

<body package="Battlesnake" selector="gameName">gameName

<body package="Battlesnake" selector="medusa">medusa

<body package="Battlesnake" selector="snakes">snakes

<body package="Battlesnake" selector="board">board

<body package="Battlesnake" selector="turn:">turn: anObject

<body package="Battlesnake" selector="turn">turn

<body package="Battlesnake" selector="gameName:">gameName: aString
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState

<body package="Battlesnake" selector="state">state
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>

<methods>
<class-id>Battlesnake.Game</class-id> <category>actions</category>

<body package="Battlesnake" selector="breedMedusa">breedMedusa
</methods>


<methods>
<class-id>Battlesnake.Head</class-id> <category>accessing</category>

<body package="Battlesnake" selector="areaWithinDistance:">areaWithinDistance: distance

<body package="Battlesnake" selector="probabilityOfReaching:in:">probabilityOfReaching: aTile in: numberOfMoves
</methods>

<methods>
<class-id>Battlesnake.Head</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription
</methods>

<methods>
<class-id>Battlesnake.Head</class-id> <category>testing</category>

<body package="Battlesnake" selector="isSnakeHead">isSnakeHead
</methods>


<methods>
<class-id>Battlesnake.Food</class-id> <category>testing</category>

<body package="Battlesnake" selector="isObstacle">isObstacle

<body package="Battlesnake" selector="isFood">isFood
</methods>

<methods>
<class-id>Battlesnake.Food</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="stateDescription">stateDescription
</methods>


<methods>
<class-id>Battlesnake.Board class</class-id> <category>instance creation</category>

<body package="Battlesnake" selector="width:height:">width: width height: height

<body package="Battlesnake" selector="defaultBoard">defaultBoard
</methods>


<methods>
<class-id>Battlesnake.Board</class-id> <category>accessing</category>

<body package="Battlesnake" selector="foods">foods

<body package="Battlesnake" selector="topRight">topRight

<body package="Battlesnake" selector="dimensions">dimensions

<body package="Battlesnake" selector="bottomLeft">bottomLeft

<body package="Battlesnake" selector="topLeft">topLeft

<body package="Battlesnake" selector="height">height

<body package="Battlesnake" selector="bottomRight">bottomRight

<body package="Battlesnake" selector="at:">at: aPoint

<body package="Battlesnake" selector="snakes">snakes

<body package="Battlesnake" selector="cornerTiles">cornerTiles

<body package="Battlesnake" selector="width">width

<body package="Battlesnake" selector="rows">rows
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>testing</category>

<body package="Battlesnake" selector="allTiles">allTiles

<body package="Battlesnake" selector="isEmpty">isEmpty
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>sorting</category>

<body package="Battlesnake" selector="weakestSnake">weakestSnake

<body package="Battlesnake" selector="strongestSnake">strongestSnake

<body package="Battlesnake" selector="snakesByPower">snakesByPower

<body package="Battlesnake" selector="sortItems:by:">sortItems: items by: aBlock
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>actions</category>

<body package="Battlesnake" selector="addSnake:">addSnake: aSnake

<body package="Battlesnake" selector="putFoodAt:">putFoodAt: aPoint

<body package="Battlesnake" selector="removeFood:">removeFood: aFood

<body package="Battlesnake" selector="removeSnake:">removeSnake: aSnake
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize

<body package="Battlesnake" selector="width:height:">width: width height: height
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>printing</category>

<body package="Battlesnake" selector="printOn:">printOn: aStream
</methods>

<methods>
<class-id>Battlesnake.Board</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="jsonState">jsonState

<body package="Battlesnake" selector="state">state
</methods>


<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>accessing</category>

<body package="Battlesnake" selector="applicationClientClass">applicationClientClass

<body package="Battlesnake" selector="activeGame:">activeGame: aGame

<body package="Battlesnake" selector="activeGame">activeGame
</methods>

<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>battlesnake API</category>

<body package="Battlesnake" selector="start">start

<body package="Battlesnake" selector="htmlDocument">htmlDocument

<body package="Battlesnake" selector="move">move

<body package="Battlesnake" selector="decodeRequest">decodeRequest

<body package="Battlesnake" selector="end">end
</methods>

<methods>
<class-id>Battlesnake.WormHole class</class-id> <category>configuration</category>

<body package="Battlesnake" selector="serverConfiguration">serverConfiguration
</methods>


<methods>
<class-id>Battlesnake.Medusa</class-id> <category>accessing</category>

<body package="Battlesnake" selector="target:">target: anObject

<body package="Battlesnake" selector="bubble">bubble

<body package="Battlesnake" selector="strategies:">strategies: anObject

<body package="Battlesnake" selector="path">path

<body package="Battlesnake" selector="bubbleSize">bubbleSize

<body package="Battlesnake" selector="findTarget">findTarget

<body package="Battlesnake" selector="path:">path: tiles

<body package="Battlesnake" selector="setNextStrategy">setNextStrategy

<body package="Battlesnake" selector="nextMove">nextMove

<body package="Battlesnake" selector="findPathToTarget">findPathToTarget

<body package="Battlesnake" selector="target">target

<body package="Battlesnake" selector="strategies">strategies

<body package="Battlesnake" selector="bubbleShift">bubbleShift
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>actions</category>

<body package="Battlesnake" selector="findEnemiesInBubble">findEnemiesInBubble

<body package="Battlesnake" selector="findFoodsInBubble">findFoodsInBubble

<body package="Battlesnake" selector="becomeInterestedInTile:">becomeInterestedInTile: aTile

<body package="Battlesnake" selector="resetTarget">resetTarget

<body package="Battlesnake" selector="loseInterestInTile:">loseInterestInTile: eachTile

<body package="Battlesnake" selector="resetPath">resetPath

<body package="Battlesnake" selector="resetBubble">resetBubble
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>strategies</category>

<body package="Battlesnake" selector="findFood">findFood

<body package="Battlesnake" selector="huntSnakes">huntSnakes

<body package="Battlesnake" selector="goToPerimeter">goToPerimeter

<body package="Battlesnake" selector="nextStrategy">nextStrategy

<body package="Battlesnake" selector="escapeSnakes">escapeSnakes

<body package="Battlesnake" selector="planStrategy">planStrategy
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>initialize-release</category>

<body package="Battlesnake" selector="initialize">initialize
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>accessing state</category>

<body package="Battlesnake" selector="startResponseState">startResponseState
</methods>

<methods>
<class-id>Battlesnake.Medusa</class-id> <category>notifications</category>

<body package="Battlesnake" selector="tileStateChanged:">tileStateChanged: anAnnouncement</body>
</methods>


<methods>
<class-id>Core.Point</class-id> <category>accessing</category>

<body package="Battlesnake" selector="battlesnakeDistance">battlesnakeDistance
</methods>


<methods>
<class-id>SiouX.Server class</class-id> <category>configuration</category>

<body package="Battlesnake" selector="battlesnakeServer:">battlesnakeServer: server
</methods>



</st-source>