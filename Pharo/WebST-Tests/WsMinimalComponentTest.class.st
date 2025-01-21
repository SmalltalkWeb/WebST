Class {
	#name : 'WsMinimalComponentTest',
	#superclass : 'WsComponentTest',
	#category : 'WebST-Tests-Examples',
	#package : 'WebST-Tests',
	#tag : 'Examples'
}

{ #category : 'accessing' }
WsMinimalComponentTest class >> componentClass [

	^ WsMinimalComponent 
]

{ #category : 'tests' }
WsMinimalComponentTest >> testComponentAndShadowRoot [

	self assert: self component innerHTML isEmpty.
	self assert: self shadowRoot notNil.
	self assert: self shadowRoot innerHTML isEmpty.
	self assert: self component view identicalTo: self shadowRoot
]
