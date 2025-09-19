Class {
	#name : 'WsJsKeyboardEventFactory',
	#superclass : 'WsJsEventFactory',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests support' }
WsJsKeyboardEventFactory >> eventClass [
	<javascript: 'return KeyboardEvent'>
]

{ #category : 'typing' }
WsJsKeyboardEventFactory >> keyDownEvent: aCharacter [
	^ self newEvent: 'keydown' with: {#key -> aCharacter}

]

{ #category : 'typing' }
WsJsKeyboardEventFactory >> keyUpEvent [
	^self newEvent: 'keyup'

]

{ #category : 'typing' }
WsJsKeyboardEventFactory >> typeChar: aCharacter in: domElement [
	| keydownEvent keyupEvent |
	keydownEvent := self keyDownEvent: aCharacter.
	domElement dispatchEvent: keydownEvent.
	domElement value: (domElement value, aCharacter asString).
	keyupEvent := self keyUpEvent.
	domElement dispatchEvent: keyupEvent
]

{ #category : 'typing' }
WsJsKeyboardEventFactory >> typeString: aString in: domElement [

	aString do: [ :each |
		self typeChar: each in: domElement ]
]
