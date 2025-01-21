Class {
	#name : 'WsMvcComponentTestOLD',
	#superclass : 'WsComponentTestOLD',
	#instVars : [
		'model'
	],
	#category : 'WebST-Tests-SupportOLD',
	#package : 'WebST-Tests',
	#tag : 'SupportOLD'
}

{ #category : 'testing' }
WsMvcComponentTestOLD class >> isAbstract [

	^ super isAbstract or: [ self == WsMvcComponentTestOLD ]
]

{ #category : 'asserting' }
WsMvcComponentTestOLD >> assertComponent [

	self assertViewModelLink.
	self replaceModel.
	self assertViewModelLink
]

{ #category : 'asserting' }
WsMvcComponentTestOLD >> assertViewModelLink [

	self subclassResponsibility
]

{ #category : 'accessing' }
WsMvcComponentTestOLD >> component: aComponent [

	super component: aComponent.
	model := aComponent model
]

{ #category : 'asserting' }
WsMvcComponentTestOLD >> newJsModel [
	"Answers a new model created in JS world"
	^ self jsComponentClass newModel
]

{ #category : 'asserting' }
WsMvcComponentTestOLD >> replaceModel [
	"Replace the model of the component in JavaScript using the component class in JS"

	"Ensure all test IVs related to component are updated since replacing the model triggers other changes. See WsMvcComponent>>#model:"

	component model: self newJsModel.
	self component: component
]

{ #category : 'tests' }
WsMvcComponentTestOLD >> testDynamicComponentCreationWithProvidedModel [

	| newComponent staticComponent jsModel |
	jsModel := self newJsModel.
	newComponent := self jsComponentClass model: jsModel.
	staticComponent := self allComponents first.
	"Inserting new component first make it easier to view result during debug"
	staticComponent parentNode prepend: newComponent.
	self assert: self allComponents size equals: 2.
	self assertComponent: newComponent
]
