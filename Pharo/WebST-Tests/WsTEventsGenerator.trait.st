Trait {
	#name : 'WsTEventsGenerator',
	#instVars : [
		'eventFactory'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsTEventsGenerator >> bridge [
	^self explicitRequirement 
]

{ #category : 'accessing' }
WsTEventsGenerator >> defaultEventFactory [
	| jsFactoryClass |
	self bridge loadClass: self eventFactoryClass.
	jsFactoryClass := self bridge jsGlobalAt: self eventFactoryClass name.
	^jsFactoryClass default
]

{ #category : 'accessing' }
WsTEventsGenerator >> eventFactory [
	^eventFactory ifNil: [ eventFactory := self defaultEventFactory ]
]

{ #category : 'accessing' }
WsTEventsGenerator >> eventFactoryClass [
	^self explicitRequirement 
]

{ #category : 'common' }
WsTEventsGenerator >> newEvent: eventType [


	^ self eventFactory newEvent: eventType
]

{ #category : 'common' }
WsTEventsGenerator >> newEvent: eventType with: associations [
	"This method is evaluated in Smalltalk world while the event factory is a JavaScript object.
	So, the message is sent through the PharoJS bridge which currently does not support making proxies on Smalltalk objects except blocks.
	So, we have to maually take care of serializing the associations here"
	
	| associationsSerialized |
	associationsSerialized := associations asPhxJsonString.
	^ self eventFactory
		  newEvent: eventType
		  optionsSerialized: associationsSerialized
]
