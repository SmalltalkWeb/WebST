Class {
	#name : 'WsConfigurationTest',
	#superclass : 'TestCase',
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsConfigurationTest >> testResourceInheritance [
	| parentConfig resource urlString childConfig actualUrlString |
	parentConfig := WsConfiguration new.
	resource := WsCssLink new.
	urlString := 'https://mycss.com'.
	parentConfig at: resource put: urlString.
	childConfig := WsConfiguration new.
	childConfig parent: parentConfig.
	actualUrlString := childConfig at: resource.
	self assert: actualUrlString equals: urlString 
]

{ #category : 'tests' }
WsConfigurationTest >> testUrlForRegisteredResource [
	| configuration resource urlString actualUrlString |
	configuration := WsConfiguration new.
	resource := WsCssLink new.
	urlString := 'https://mycss.com'.
	configuration at: resource put: urlString.
	actualUrlString := configuration at: resource.
	self assert: actualUrlString equals: urlString 
]

{ #category : 'tests' }
WsConfigurationTest >> testUrlForUnregisteredResource [
	| configuration resource |
	configuration := WsConfiguration new.
	resource := WsCssLink new.
	self should: [configuration at: resource] raise: NotFound
]
