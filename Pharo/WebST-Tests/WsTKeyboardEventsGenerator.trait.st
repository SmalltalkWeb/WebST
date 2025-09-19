Trait {
	#name : 'WsTKeyboardEventsGenerator',
	#traits : 'WsTEventsGenerator',
	#classTraits : 'WsTEventsGenerator classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsTKeyboardEventsGenerator >> eventFactoryClass [
	^WsJsKeyboardEventFactory
]

{ #category : 'typing' }
WsTKeyboardEventsGenerator >> keyDownEvent: aCharacter [
	^self defaultEventFactory keyDownEvent: aCharacter

]

{ #category : 'typing' }
WsTKeyboardEventsGenerator >> keyUpEvent [
	^self defaultEventFactory keyUpEvent

]

{ #category : 'typing' }
WsTKeyboardEventsGenerator >> typeString: aString in: domElement [

	"domElement value: aString."
	self eventFactory typeString: aString in: domElement
]
