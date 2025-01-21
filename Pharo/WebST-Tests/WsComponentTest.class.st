Class {
	#name : 'WsComponentTest',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTSingleComponentTest',
	#classTraits : 'WsTSingleComponentTest classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'testing' }
WsComponentTest class >> isAbstract [

	^ self == WsComponentTest
]

{ #category : 'asserting' }
WsComponentTest >> assert: actualValue equalsDataAttributeAt: aSymbol [

	| expectedValue |
	expectedValue := self dataAttributesDict at: aSymbol. 
	self assert: actualValue equals: expectedValue
]

{ #category : 'asserting' }
WsComponentTest >> assertComponentClass [

	| actualClass expectedClass |
	expectedClass := self bridge jsGlobalAt: self componentClass name.
	actualClass := self evalBlock: [ component class ].
	self assert: actualClass identicalTo: expectedClass
]

{ #category : 'asserting' }
WsComponentTest >> assertCustomAttributesApplied [

	^self 
]

{ #category : 'asserting' }
WsComponentTest >> assertDefaultAttributesApplied [

	^ self
]

{ #category : 'accessing' }
WsComponentTest >> dataAttributesDict [

	^ self class dataAttributes asDictionary
]

{ #category : 'accessing' }
WsComponentTest >> jsComponentClass [

	^ self bridge jsGlobalAt: self componentClass name
]

{ #category : 'tests' }
WsComponentTest >> testDynamicComponentCreation [

	| newComponent |
	newComponent := self jsComponentClass new.
	"Inserting new component first make it easier to view result during debug"
	self document body prepend: newComponent.
	self assert: self component identicalTo: self firstComponent.
	self assertComponentClass.
	self assertDefaultAttributesApplied
]

{ #category : 'tests' }
WsComponentTest >> testStaticComponentCreation [
	"Component is defined using HTML tags."

	self assertComponentClass.
	self assertCustomAttributesApplied
]
