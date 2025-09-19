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
