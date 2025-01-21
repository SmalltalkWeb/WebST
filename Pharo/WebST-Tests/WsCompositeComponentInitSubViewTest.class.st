Class {
	#name : 'WsCompositeComponentInitSubViewTest',
	#superclass : 'WsComponentTestOLD',
	#category : 'WebST-Tests-ViewCustomization',
	#package : 'WebST-Tests',
	#tag : 'ViewCustomization'
}

{ #category : 'accessing' }
WsCompositeComponentInitSubViewTest class >> componentClass [
	^WsCompositeComponentInitSubView
]

{ #category : 'asserting' }
WsCompositeComponentInitSubViewTest >> assertComponent [

	| subView |
	subView := shadowRoot querySelector: 'p'.
	self assert: subView textContent equals: WsCompositeInitSubView subViewTextContent 
]
