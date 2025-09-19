Trait {
	#name : 'WsTDragNDropEventGenerator',
	#traits : 'WsTMouseEventsGenerator',
	#classTraits : 'WsTMouseEventsGenerator classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView insertAbove: dropTarget [

	self ensure: draggedView below: dropTarget.
	self dragNDrop: draggedView overTopOf: dropTarget
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView insertBelow: dropTarget [

	self ensure: draggedView above: dropTarget.
	self dragNDrop: draggedView overBottomOf: dropTarget
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView over: dropTarget clientX: clientX clientY: clientY [

	self dragNDrop: draggedView over: dropTarget clientX: clientX clientY: clientY shift: false

]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView over: dropTarget clientX: clientX clientY: clientY shift: isShiftKeyPressed [

	self startDragging: draggedView shift: isShiftKeyPressed.
	self dragOver: dropTarget clientX: clientX clientY: clientY.
	self
		drop: draggedView
		on: dropTarget
		clientX: clientX
		clientY: clientY
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView overBottomOf: dropTarget [

	| targetBounds |
	targetBounds := dropTarget getBoundingClientRect .
	self
		dragNDrop: draggedView
		over: dropTarget
		clientX: targetBounds left + 2
		clientY: targetBounds bottom - 2
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView overLeftOf: dropTarget [

	| targetBounds |
	targetBounds := dropTarget getBoundingClientRect.
	self
		dragNDrop: draggedView
		over: dropTarget
		clientX: targetBounds left + 2
		clientY: targetBounds top + 2
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView overRightOf: dropTarget [

	| targetBounds |
	targetBounds := dropTarget getBoundingClientRect.
	self
		dragNDrop: draggedView
		over: dropTarget
		clientX: targetBounds right - 2
		clientY: targetBounds top + 2
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDrop: draggedView overTopOf: dropTarget [

	| bounds |
	bounds := dropTarget getBoundingClientRect. 
	self
		dragNDrop: draggedView
		over: dropTarget
		clientX: bounds left + 2
		clientY: bounds top + 2
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragNDropExternalViewOver: dropTarget [ 

	| dragOverEvent dropEvent dragEnterEvent targetBounds |
	dragEnterEvent := self newEvent: #dragenter.
	dropTarget dispatchEvent: dragEnterEvent.
	dragOverEvent := self newEvent: #dragover.
	dropTarget dispatchEvent: dragOverEvent.
	dropEvent := self newEvent: #drop.
	targetBounds :=dropTarget getBoundingClientRect.
	dropEvent
		instVarNamed: #clientX put: targetBounds left + 2;
		instVarNamed: #clientY put: targetBounds top + 2.
	dropTarget dispatchEvent: dropEvent.

]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> dragOverTopOf: dropTarget [ 

		| bounds |
	bounds := dropTarget getBoundingClientRect. 
	self
		dragOver: dropTarget
		clientX: bounds left + 2
		clientY: bounds top + 2
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> drop: draggedView on: dropTarget clientX: clientX clientY: clientY [

	| dropEvent dragEndEvent |
	dropEvent := self newEvent: #drop.
	dropEvent
		instVarNamed: #clientX put: clientX;
		instVarNamed: #clientY put: clientY.
	dropTarget dispatchEvent: dropEvent.
	dragEndEvent := self newEvent: #dragend.
	draggedView dispatchEvent: dragEndEvent
]

{ #category : 'tests support' }
WsTDragNDropEventGenerator >> drop: draggedView onTopOf: dropTarget [

	| bounds |
	bounds := dropTarget getBoundingClientRect.
	self
		drop: draggedView
		on: dropTarget
		clientX: bounds left + 2
		clientY: bounds top + 2
]
