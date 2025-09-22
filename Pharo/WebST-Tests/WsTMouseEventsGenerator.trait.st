Trait {
	#name : 'WsTMouseEventsGenerator',
	#traits : 'WsTEventsGenerator',
	#classTraits : 'WsTEventsGenerator classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'clicking' }
WsTMouseEventsGenerator >> clickElement: domElement [

	self clickElement: domElement shift: false
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> clickElement: domElement at: aPoint [
	| event |
	event := self newEvent: #click.
	event 
		instVarNamed: #clientX put: aPoint x;
		instVarNamed: #clientY put: aPoint y.
	domElement dispatchEvent: event
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> clickElement: domElement shift: aBoolean [

	| clickEvent |
	self mouseDownElement: domElement shift: aBoolean.
	clickEvent := self newEvent: #click.
	clickEvent instVarNamed: #shiftKey put: aBoolean.
	domElement dispatchEvent: clickEvent
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> doubleClickElement: domElement [

	self dispatchEvent: #dblclick to: domElement
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> drag: draggedView dropOn: targetView [

	self drag: draggedView dropOn: targetView shift: false
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> drag: draggedView dropOn: targetView clientX: clientX clientY: clientY [

	self drag: draggedView dropOn: targetView clientX: clientX clientY: clientY shift: false
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> drag: draggedView dropOn: targetView clientX: clientX clientY: clientY shift: isShiftKeyPressed [

	| dropEvent dragEndEvent |
	self startDragging: draggedView.
	self dragOver: targetView clientX: clientX clientY: clientY.
	dropEvent := self newEvent: #drop.
	dropEvent
		instVarNamed: #clientX put: clientX;
		instVarNamed: #clientY put: clientY.
	targetView dispatchEvent: dropEvent.
	dragEndEvent := self newEvent: #dragend.
	draggedView dispatchEvent: dragEndEvent
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> drag: draggedView dropOn: targetView shift: isShiftKeyPressed [

	self drag: draggedView dropOn: targetView clientX: 1 clientY: 1 shift: isShiftKeyPressed
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> dragOver: dropTarget clientX: clientX clientY: clientY [

	| dragOverEvent dragEnterEvent |
	dragEnterEvent := self newEvent: #dragenter.
	dragEnterEvent
		instVarNamed: #clientX put: clientX;
		instVarNamed: #clientY put: clientY.
	dropTarget dispatchEvent: dragEnterEvent.
	dragOverEvent := self newDragOverEvent.
	dragOverEvent
		instVarNamed: #clientX put: clientX;
		instVarNamed: #clientY put: clientY.
	dropTarget dispatchEvent: dragOverEvent
]

{ #category : 'accessing' }
WsTMouseEventsGenerator >> eventFactoryClass [
	^WsJsMouseEventFactory 
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> mouseDownElement: domElement [ 
	self mouseDownElement: domElement shift: false

]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> mouseDownElement: domElement at: aPoint [
	| event |
	event := self newEvent: #mousedown.
	event 
		instVarNamed: #clientX put: aPoint x;
		instVarNamed: #clientY put: aPoint y.
	domElement dispatchEvent: event
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> mouseDownElement: domElement shift: aBoolean [

	| event |
	event := self newEvent: #mousedown.
	event instVarNamed: #shiftKey put: aBoolean.
	domElement dispatchEvent: event
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> mouseUpElement: domElement [ 
	^self mouseUpElement: domElement at: 0@0
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> mouseUpElement: domElement at: aPoint [

	| event |
	event := self newEvent: #mouseup.
	event
		instVarNamed: #clientX put: aPoint x;
		instVarNamed: #clientY put: aPoint y.
	domElement dispatchEvent: event
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> newDragOverEvent [

	^ self evalBlock: [ WsJsMouseEventFactory dragOver ]
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> newDragStartEvent [

	^ self evalBlock: [ WsJsMouseEventFactory dragStart ]
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> shiftClickElement: domElement [

	self clickElement: domElement shift: true
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> startDragging: draggedView [ 
	self startDragging: draggedView shift: false
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> startDragging: draggedView shift: isShiftKeyPressed [

	| dragStartEvent |
	self mouseDownElement: draggedView shift: isShiftKeyPressed.
	dragStartEvent := self newDragStartEvent.
	dragStartEvent shiftKey: isShiftKeyPressed.
	draggedView dispatchEvent: dragStartEvent
]
