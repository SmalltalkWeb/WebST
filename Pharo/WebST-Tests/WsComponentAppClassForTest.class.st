Class {
	#name : 'WsComponentAppClassForTest',
	#superclass : 'WsParametrizableSingleComponentApp',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'WsView' }
WsComponentAppClassForTest class >> componentClass: aComponentClass [
	self rootComponentClass: aComponentClass 
]
