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
	event := self newEvent: #click with: {
			         (#clientX -> aPoint x).
			         (#clientY -> aPoint y) }.
	domElement dispatchEvent: event
]

{ #category : 'clicking' }
WsTMouseEventsGenerator >> clickElement: domElement shift: aBoolean [

	| mouseDownEvent clickEvent mouseUpEvent |
	mouseDownEvent := self newEvent: #mousedown with: {#shiftKey -> aBoolean. #bubbles -> true}.
	domElement dispatchEvent: mouseDownEvent.
	clickEvent := self newEvent: #click with: {#shiftKey -> aBoolean. #bubbles -> true}.
	domElement dispatchEvent: clickEvent.
	mouseUpEvent := self newEvent: #mouseup with: {#shiftKey -> aBoolean. #bubbles -> true}.
	domElement dispatchEvent: mouseUpEvent

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

	| dropEvent dragEndEvent  |
	self startDragging: draggedView.
	self dragOver: targetView clientX: clientX clientY: clientY.
	dropEvent := self newEvent: #drop with: {
			             (#clientX -> clientX).
			             (#clientY -> clientY) }.
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
	dragEnterEvent := self newEvent: #dragenter with: {
			             (#clientX -> clientX).
			             (#clientY -> clientY) }.
	dropTarget dispatchEvent: dragEnterEvent.
	dragOverEvent := self newDragOverEventClientX: clientX clientY: clientY.
	dropTarget dispatchEvent: dragOverEvent
]

{ #category : 'accessing' }
WsTMouseEventsGenerator >> eventFactoryClass [
	^WsJsMouseEventFactory 
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseDownElement: domElement [ 
	self mouseDownElement: domElement shift: false

]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseDownElement: domElement at: aPoint [

	| event |
	event := self newEvent: #mousedown with: {#clientX -> aPoint x. #clientY -> aPoint y}.
	domElement dispatchEvent: event
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseDownElement: domElement shift: aBoolean [

	| event |
	event := self newEvent: #mousedown with: {#shiftKey -> aBoolean}.
	domElement dispatchEvent: event
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseDownThenUpElement: anObject [

	self mouseDownElement: anObject.
	self mouseUpElement: anObject
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseDownThenUpElement: anObject at: aPoint [

	self mouseDownElement: anObject at: aPoint.
	self mouseUpElement: anObject at: aPoint
]

{ #category : 'moving' }
WsTMouseEventsGenerator >> mouseMoveElement: domElement to: aPoint [

	| event |
	self dispatchEvent: 'mouseenter' to: domElement.
	event := self newEvent: 'mousemove' with: {
			         (#clientX -> aPoint x).
			         (#clientY -> aPoint y).
			         (#screenX -> aPoint x).
			         (#screenY -> aPoint y).
			         (#bubbles -> true) }.
	domElement dispatchEvent: event
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseUpElement: domElement [ 
	^self mouseUpElement: domElement at: 0@0
]

{ #category : 'mouse down / up' }
WsTMouseEventsGenerator >> mouseUpElement: domElement at: aPoint [

	| event |
	event := self newEvent: #mouseup with: {
			         (#clientX -> aPoint x).
			         (#clientY -> aPoint y) }.
	domElement dispatchEvent: event
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> newDragOverEvent [

	^ self eventFactory dragOver
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> newDragOverEventClientX: clientX clientY: clientY [

	^ self eventFactory dragOverClientX: clientX clientY: clientY
]

{ #category : 'dragging' }
WsTMouseEventsGenerator >> newDragStartEvent [

	^ self eventFactory dragStart
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
