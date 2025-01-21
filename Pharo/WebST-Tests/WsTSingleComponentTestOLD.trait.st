Trait {
	#name : 'WsTSingleComponentTestOLD',
	#instVars : [
		'component',
		'shadowRoot'
	],
	#traits : 'PjTAppRunsInJS',
	#classTraits : 'PjTAppRunsInJS classTrait',
	#category : 'WebST-Tests-SupportOLD',
	#package : 'WebST-Tests',
	#tag : 'SupportOLD'
}

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> appClass [

	^ self appClassGenerator
		  appFor: self componentClass
		  attributes: self dataAttributes
		  style: self componentStyle
		  cssClasses: self componentCssClasses
		  appSuperclass: self appSuperclass
		  traits: self appTraits
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> appClassGenerator [
	^self appClassGeneratorClass current
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> appClassGeneratorClass [
	^WsComponentAppClassTestResource 
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> appSuperclass [

	^ WsParametrizableSingleComponentApp
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> appTraits [

	^ { WsTSingleComponentApp }
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> componentClass [
	self explicitRequirement 
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> componentCssClasses [

	^ nil
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> componentStyle [
	^nil
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD classSide >> dataAttributes [

	^ #(  )
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> allComponents [

	^ self document querySelectorAll: self componentTagName
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> component [
	^component ifNil: [ component := self firstComponent ]

]

{ #category : 'as yet unclassified' }
WsTSingleComponentTestOLD >> component: aComponent [

	component := aComponent.
	shadowRoot := component at: #shadowRoot 
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> componentClass [

	^ self class componentClass
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> componentTagName [

	^ self componentClass tagName
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> firstComponent [
	^self allComponents first
]

{ #category : 'accessing' }
WsTSingleComponentTestOLD >> shadowRoot [

	^ shadowRoot ifNil: [ shadowRoot := self component view ]
]
