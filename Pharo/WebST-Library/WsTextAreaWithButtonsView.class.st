Class {
	#name : 'WsTextAreaWithButtonsView',
	#superclass : 'WsBootstrap5View',
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextAreaWithButtonsView >> renderOuterHtmlOn: html [

	html div
		class: 'form-floating';
		with: [
			html textArea class: 'form-control textInput'.
			html div
				class: 'd-flex justify-content-end p-2 column-gap-1';
				with: [ html render: WsSaveCancelButtonsView  ]]
]
