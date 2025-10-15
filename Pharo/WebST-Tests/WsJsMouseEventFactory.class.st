Class {
	#name : 'WsJsMouseEventFactory',
	#superclass : 'WsJsEventFactory',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'event creation' }
WsJsMouseEventFactory >> click [
	^self newEvent: #click
]

{ #category : 'event creation' }
WsJsMouseEventFactory >> dragOver [

	^ self newDragRelatedEvent: #dragover
]

{ #category : 'event creation' }
WsJsMouseEventFactory >> dragOverClientX: clientX clientY: clientY [

	^ self newDragRelatedEvent: #dragover clientX: clientX clientY: clientY
]

{ #category : 'event creation' }
WsJsMouseEventFactory >> dragStart [
	^self newDragRelatedEvent: #dragstart
]

{ #category : 'tests support' }
WsJsMouseEventFactory >> eventClass [
	<javascript: 'return MouseEvent'>
]

{ #category : 'dragging' }
WsJsMouseEventFactory >> newDragRelatedEvent: typeString [

	| newEvent |
	newEvent := document createEvent: #HTMLEvents.
	newEvent
		initEvent: typeString with: true with: true;
		instVarNamed: #shiftKey put: false;
		instVarNamed: #cancelBubble put: false;
		instVarNamed: #dataTransfer put: newEvent;
		instVarNamed: #setDragImage put: [  ];
		instVarNamed: #clientX put: 0;
		instVarNamed: #clientY put: 0.
	^ newEvent
]

{ #category : 'dragging' }
WsJsMouseEventFactory >> newDragRelatedEvent: typeString clientX: clientX clientY: clientY [

	| newEvent |
	newEvent := document createEvent: #HTMLEvents.
	newEvent
		initEvent: typeString with: true with: true;
		instVarNamed: #shiftKey put: false;
		instVarNamed: #cancelBubble put: false;
		instVarNamed: #dataTransfer put: newEvent;
		instVarNamed: #setDragImage put: [  ];
		instVarNamed: #clientX put: clientX;
		instVarNamed: #clientY put: clientY.
	^ newEvent
]
