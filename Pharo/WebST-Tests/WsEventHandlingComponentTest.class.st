Class {
	#name : 'WsEventHandlingComponentTest',
	#superclass : 'WsComponentTestOLD',
	#category : 'WebST-Tests-SupportOLD',
	#package : 'WebST-Tests',
	#tag : 'SupportOLD'
}

{ #category : 'accessing' }
WsEventHandlingComponentTest class >> componentClass [

	^ WsEventTestingComponent
]

{ #category : 'asserting' }
WsEventHandlingComponentTest >> assertComponent [

	self waitUntil: [component isConnectionToDomCaptured] 
]
