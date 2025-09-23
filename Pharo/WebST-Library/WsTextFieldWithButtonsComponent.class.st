Class {
	#name : 'WsTextFieldWithButtonsComponent',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'input',
		'cancelBlock',
		'saveBlock'
	],
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent class >> defaultPlaceholderAttribute [
	^'...'
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent class >> modelClass [

	^WsTextModel 
]

{ #category : 'class initialization' }
WsTextFieldWithButtonsComponent class >> tagName [

	^'ws-text-input'
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextFieldWithButtonsView 
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> cancel [

	self displayModelText.
	self cancelBlock value
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> cancelBlock [

	^ cancelBlock
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> cancelBlock: anObject [

	cancelBlock := anObject
]

{ #category : 'initialization' }
WsTextFieldWithButtonsComponent >> cancelButton [

	^ self viewFirstElementByCssClass: 'cancelButton'
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> defaultPlaceholderAttribute [
	^self class defaultPlaceholderAttribute
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> displayModelText [

	self displayText: model text
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> displayText: aString [

	input value: aString
]

{ #category : 'initialization' }
WsTextFieldWithButtonsComponent >> getReady [

	super getReady.
	input := self viewFirstElementByCssClass: 'textInput'.
	self updatePlaceholder.
	self onClickElement: self cancelButton do: [ self cancel ].
	self onClickElement: self saveButton do: [ self save ].
	model -@ #textPort => [ :newText | self displayText: newText ].
	self displayModelText
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> inputValue [
	^input value
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> placeholderAttribute [
	^self dataAttributeAt: #placeholder ifAbsent: [ self defaultPlaceholderAttribute]
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> save [

	self updateModelText.
	self saveBlock ifNil: [^self].
	self saveBlock value: input value
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> saveBlock [

	^ saveBlock
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> saveBlock: anObject [

	saveBlock := anObject
]

{ #category : 'initialization' }
WsTextFieldWithButtonsComponent >> saveButton [

	^ self viewFirstElementByCssClass: 'saveButton'
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> savedText [
	^self model text
]

{ #category : 'accessing' }
WsTextFieldWithButtonsComponent >> textInput [
	^input
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> updateModelText [

	model text: input value
]

{ #category : 'actions' }
WsTextFieldWithButtonsComponent >> updatePlaceholder [

	self textInput placeholder: self placeholderAttribute 
]
