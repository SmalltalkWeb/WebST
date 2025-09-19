Class {
	#name : 'WsJsEventFactory',
	#superclass : 'Object',
	#pools : [
		'PjBrowserGlobals'
	],
	#classInstVars : [
		'default'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'default instance' }
WsJsEventFactory class >> default [

	^ default ifNil: [ default := self new ]
]

{ #category : 'event creation' }
WsJsEventFactory class >> newEvent: eventType [
	^self default newEvent: eventType
]

{ #category : 'default instance' }
WsJsEventFactory class >> resetDefault [

	default := nil
]

{ #category : 'tests support' }
WsJsEventFactory >> eventClass [
	self subclassResponsibility 
]

{ #category : 'tests support' }
WsJsEventFactory >> newEvent: eventType [

	| newEvent |
	newEvent := self eventClass new: eventType.
	newEvent
		initEvent: eventType
		with: true
		with: true
		with: nil.
	^ newEvent
]

{ #category : 'tests support' }
WsJsEventFactory >> newEvent: eventType with: associations [

	^self eventClass new: eventType with: associations asJsObject 
]
