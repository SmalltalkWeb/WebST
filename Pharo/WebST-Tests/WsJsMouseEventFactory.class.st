Class {
	#name : 'WsJsMouseEventFactory',
	#superclass : 'WsJsEventFactory',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'event creation' }
WsJsMouseEventFactory class >> click [
	^self newEvent: #click
]

{ #category : 'event creation' }
WsJsMouseEventFactory class >> dragOver [

	^ self newDragRelatedEvent: #dragover
]

{ #category : 'event creation' }
WsJsMouseEventFactory class >> dragStart [
	^self newDragRelatedEvent: #dragstart
]

{ #category : 'event creation' }
WsJsMouseEventFactory class >> newDragRelatedEvent: typeString [

	^ self default
		  newDragRelatedEvent: typeString
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
