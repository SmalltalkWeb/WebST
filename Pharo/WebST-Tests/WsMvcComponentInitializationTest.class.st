Class {
	#name : 'WsMvcComponentInitializationTest',
	#superclass : 'WsMvcComponentTestOLD',
	#instVars : [
		'viewResetCountExpected',
		'viewInitCountExpected',
		'modelInitCountExpected'
	],
	#category : 'WebST-Tests-SupportOLD',
	#package : 'WebST-Tests',
	#tag : 'SupportOLD'
}

{ #category : 'accessing' }
WsMvcComponentInitializationTest class >> componentClass [

	^ WsInitializationCounterForTest 
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertComponent [

	self assert: component viewResetCount equals: 1.
	self assert: component viewInitCount equals: 1.
	self assert: component modelInitCount equals: 1
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertViewModelLink [

	^self
]
