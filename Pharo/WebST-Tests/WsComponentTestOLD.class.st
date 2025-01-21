Class {
	#name : 'WsComponentTestOLD',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTUrlTest + WsTSingleComponentTestOLD',
	#classTraits : 'WsTUrlTest classTrait + WsTSingleComponentTestOLD classTrait',
	#category : 'WebST-Tests-SupportOLD',
	#package : 'WebST-Tests',
	#tag : 'SupportOLD'
}

{ #category : 'accessing' }
WsComponentTestOLD class >> componentClass [
	^self subclassResponsibility 
]

{ #category : 'testing' }
WsComponentTestOLD class >> isAbstract [

	^ self == WsComponentTestOLD
]

{ #category : 'accessing' }
WsComponentTestOLD class >> resources [

	^ super resources , { self appClassGeneratorClass }
]

{ #category : 'asserting' }
WsComponentTestOLD >> assertComponent [ 
	self subclassResponsibility 
]

{ #category : 'asserting' }
WsComponentTestOLD >> assertComponent: aComponent [

	self assertComponent: aComponent with: nil
]

{ #category : 'asserting' }
WsComponentTestOLD >> assertComponent: aComponent with: aBlock [

	self component: aComponent.
	self assertComponentClass.
	aBlock value.
	self assertComponent
]

{ #category : 'tests' }
WsComponentTestOLD >> testDynamicComponentCreationBasic [

	| newComponent |
	newComponent := self jsComponentClass new.
	"Inserting new component first make it easier to view result during debug"
	document body prepend: newComponent.
	self assert: self allComponents size equals: 2.
	self
		assertComponent: newComponent
		with: [ self assertDefaultAttributesApplied ]
]

{ #category : 'tests' }
WsComponentTestOLD >> testStaticComponentCreation [
	"Component is defined using HTML tags. See WsTComponentApp >> #newPage."

	| allComponents |
	allComponents := self allComponents.
	self assert: allComponents size equals: 1.
	self
		assertComponent: self firstComponent
		with: [ self assertCustomAttributesApplied ]
]
