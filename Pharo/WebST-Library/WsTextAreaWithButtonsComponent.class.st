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
WsTextAreaWithButtonsComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextAreaWithButtonsView 
]
