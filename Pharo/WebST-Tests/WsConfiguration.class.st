Class {
	#name : 'WsConfiguration',
	#superclass : 'Object',
	#instVars : [
		'urlsDict',
		'parent'
	],
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'accessing' }
WsConfiguration >> at: resource [
	^urlsDict at: resource ifAbsent: [ self parentAt: resource ]
]

{ #category : 'accessing' }
WsConfiguration >> at: resource put: urlString [
	urlsDict at: resource put: urlString 
]

{ #category : 'initialization' }
WsConfiguration >> initialize [ 
	super initialize.
	urlsDict := Dictionary new.

]

{ #category : 'accessing' }
WsConfiguration >> parent [

	^ parent
]

{ #category : 'accessing' }
WsConfiguration >> parent: anObject [

	parent := anObject
]

{ #category : 'accessing' }
WsConfiguration >> parentAt: resource [
	self parent ifNil: [ NotFound signalFor: resource ].
	^self parent at: resource 
]
