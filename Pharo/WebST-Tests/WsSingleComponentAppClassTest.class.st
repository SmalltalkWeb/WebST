Class {
	#name : 'WsSingleComponentAppClassTest',
	#superclass : 'TestCase',
	#instVars : [
		'appClass'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsSingleComponentAppClassTest >> setUp [
	super setUp.
	appClass := WsComponentAppClassForTest.
	appClass rootComponentAttributes: #()
]

{ #category : 'tests' }
WsSingleComponentAppClassTest >> testComponentAttributes [
	| componentTag expectedHtml attributesDict |
	appClass componentClass: WsMinimalComponent.
	componentTag := WsMinimalComponent tagName.
	expectedHtml := String streamContents: [: str |
		str << $< ; << componentTag ; << '></' ; << componentTag; << $>
	].
	self assert: (appClass html includesSubstring: expectedHtml).
	attributesDict := {#int -> 42. #string -> 'Wunderful' } asDictionary.
	appClass rootComponentAttributes: attributesDict.
	expectedHtml := String streamContents: [: str |
		str << $< ; << componentTag; space.
		attributesDict keysAndValuesDo: [ : key : value | 
			str << key ; << '="' ; << value asString; << '" '].
		str << '></' ; << componentTag; << $>
	].

]

{ #category : 'tests' }
WsSingleComponentAppClassTest >> testExportDifferentComponents [
	| allComponentClasses allTagNames appHtml componentTag |
	allComponentClasses := {WsMinimalComponent.  WsCounterComponent. WsToggleIconTextComponent}.
	allTagNames :=  allComponentClasses collect: #tagName.
	self assert: allTagNames size equals: allComponentClasses size.
	allComponentClasses do: [ : componentClass | 
		appClass componentClass: componentClass.
		appHtml := appClass html.
		componentTag := componentClass tagName.
		self assert: (appHtml includesSubstring: componentTag).
		(allTagNames copyWithout: componentTag) do: [ : otherTag | 
			self deny: (appHtml includesSubstring: otherTag)
		]
	].

]
