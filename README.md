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
* Add a property to any DocumentType you want using the "Document Dashboard" DataType installed, and you can have a custom dashboard for them

[RELEASE]: https://github.com/vokseverk/document-dashboard/releases

## Customization

You can use XSLT's awesome templating mechanism to create custom dashboards for your specific types of documents, just
by adding them to the `CustomDashboards.xslt` file — there's a simple demo of an *images* mode to show how you can
create a wall of images, e.g. for a `People` container showing an image from all the child nodes.
