Class {
	#name : 'WsTextAreaWithButtonsComponent',
	#superclass : 'WsTextFieldWithButtonsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent class >> defaultCheckSpellingAttribute [
	^'true'
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent class >> defaultTextAreaHeightAttribute [
	^''
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent class >> defaultTextAreaResizeDirectionsAttribute [
	^'both'
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextAreaWithButtonsView 
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> checkSpellingAttribute [
	^self dataAttributeAt: #checkSpelling ifAbsent: [ self defaultCheckSpellingAttribute ]
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> defaultCheckSpellingAttribute [
	^self class defaultCheckSpellingAttribute
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> defaultTextAreaHeightAttribute [
	^self class defaultTextAreaHeightAttribute
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> defaultTextAreaResizeDirectionsAttribute [
	^self class defaultTextAreaResizeDirectionsAttribute
]

{ #category : 'initialization' }
WsTextAreaWithButtonsComponent >> getReady [

	super getReady.
	self updateInputCheckSpelling.
	self updateTextAreaHeight.
	self updateTextAreaResizeDirections 
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> textAreaHeightAttribute [
	^self dataAttributeAt: #textAreaHeight ifAbsent: [ self defaultTextAreaHeightAttribute ]
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponent >> textAreaResizeDirectionsAttribute [
	^self dataAttributeAt: #resizeDirections ifAbsent: [ self defaultTextAreaResizeDirectionsAttribute ]
]

{ #category : 'actions' }
WsTextAreaWithButtonsComponent >> updateInputCheckSpelling [

	| shouldCheckSpelling |
	shouldCheckSpelling := self checkSpellingAttribute asLowercase = true asString.
	self textInput instVarNamed: #spellcheck put: shouldCheckSpelling
]

{ #category : 'actions' }
WsTextAreaWithButtonsComponent >> updateTextAreaHeight [
	self textInput style height: self textAreaHeightAttribute
]

{ #category : 'actions' }
WsTextAreaWithButtonsComponent >> updateTextAreaResizeDirections [
	self textInput instVarNamed: #resize put: self textAreaResizeDirectionsAttribute
]
