<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks®, Pre-Release 8.2 (feb16.1) of 5 February, 2016 on 18 February, 2016 at 5:19:01 PM</time-stamp>


<component-created>
<name>Battlesnake-Tests</name> <type>package</type>
</component-created><!-- Package Battlesnake-Tests(0.0.15,jkott)= -->


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

<body package="Battlesnake-Tests" selector="hostPortString">hostPortString

<body package="Battlesnake-Tests" selector="urlString:">urlString: path
</methods>

<methods>
<class-id>Battlesnake.GameTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="testGetIndex">testGetIndex

<body package="Battlesnake-Tests" selector="testGameCreation">testGameCreation

<body package="Battlesnake-Tests" selector="newGameState">newGameState

<body package="Battlesnake-Tests" selector="testPostStart">testPostStart
</methods>

<methods>
<class-id>Battlesnake.GameTest</class-id> <category>initialize-release</category>

<body package="Battlesnake-Tests" selector="setUp">setUp
</methods>


<methods>
<class-id>Battlesnake.BoardTest</class-id> <category>testing</category>

<body package="Battlesnake-Tests" selector="testExampleBoard">testExampleBoard

<body package="Battlesnake-Tests" selector="testSimplePath">testSimplePath

<body package="Battlesnake-Tests" selector="testInsideNeighbours">testInsideNeighbours

<body package="Battlesnake-Tests" selector="testBestPath">testBestPath

<body package="Battlesnake-Tests" selector="testCorners">testCorners

<body package="Battlesnake-Tests" selector="testNodeDistances">testNodeDistances

<body package="Battlesnake-Tests" selector="testBestPathWithObstacles">testBestPathWithObstacles
</methods>


<methods>
<class-id>Battlesnake.BattlesnakeTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="testJakeSnake">testJakeSnake</body>
</methods>

<methods>
<class-id>Battlesnake.BattlesnakeTest</class-id> <category>running</category>

<body package="Battlesnake-Tests" selector="startData">startData

<body package="Battlesnake-Tests" selector="boardStateData">boardStateData

<body package="Battlesnake-Tests" selector="runTest:">runTest: aReceiver
</methods>


<methods>
<class-id>Battlesnake.SnakeTest</class-id> <category>initialize-release</category>

<body package="Battlesnake-Tests" selector="setUp">setUp

<body package="Battlesnake-Tests" selector="tearDown">tearDown
</methods>

<methods>
<class-id>Battlesnake.SnakeTest</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="testNewSnake">testNewSnake

<body package="Battlesnake-Tests" selector="testMedusaBubble">testMedusaBubble

<body package="Battlesnake-Tests" selector="testSnakeBody">testSnakeBody
</methods>


<methods>
<class-id>Battlesnake.TestObstacle</class-id> <category>accessing state</category>

<body package="Battlesnake-Tests" selector="stateDescription">stateDescription
</methods>


<methods>
<class-id>Battlesnake.Board class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleBoard">exampleBoard
</methods>


<methods>
<class-id>Battlesnake.Board</class-id> <category>tests</category>

<body package="Battlesnake-Tests" selector="putTestObstacleAt:">putTestObstacleAt: aPoint
</methods>


<methods>
<class-id>Battlesnake.Snake class</class-id> <category>example snakes</category>

<body package="Battlesnake-Tests" selector="exampleEnemy1_on:">exampleEnemy1_on: aBoard

<body package="Battlesnake-Tests" selector="exampleOn:">exampleOn: aBoard

<body package="Battlesnake-Tests" selector="exampleEnemy2_on:">exampleEnemy2_on: aBoard

<body package="Battlesnake-Tests" selector="exampleMedusaOn:">exampleMedusaOn: aBoard

<body package="Battlesnake-Tests" selector="exampleSnakes:">exampleSnakes: aBoard

<body package="Battlesnake-Tests" selector="exampleNoodlezOn:">exampleNoodlezOn: aBoard
</methods>


<methods>
<class-id>Battlesnake.Game class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleGame">exampleGame
</methods>


<methods>
<class-id>Battlesnake.Food class</class-id> <category>instance creation</category>

<body package="Battlesnake-Tests" selector="exampleCoordinates">exampleCoordinates
</methods>



</st-source>