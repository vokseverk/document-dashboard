# Document Dashboard

A customizable dashboard for Umbraco documents, e.g. so "container" types can show something useful
when selected in the Content tree.

## Requirements

This is implemented as a simple XSLT macro by using the [uComponents RenderMacro DataType][REND], so
you need [uComponents][UCOM] installed for it to work.

[REND]: http://ucomponents.codeplex.com/wikipage?title=RenderMacro
[UCOM]: http://ucomponents.org

## Installation

* Install the [package][RELEASE] as any other package, from the Developer section of Umbraco
* Create a DataType using the **uComponents: RenderMacro** render control and choose the **Document Dashboard** macro on the property editor
* Add a property to any DocumentType you want using the new DataType you created, and you can have a custom dashboard for them

[RELEASE]: #todo

## Customization

