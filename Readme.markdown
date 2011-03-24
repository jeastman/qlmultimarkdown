QLMarkdown
==========

by Phil Toland
<http://fiatdev.com>

fixes and improvements by Michael Dominic K.
<http://www.mdk.org.pl>

MultiMarkdown 3.0 support by Fletcher T. Penney
<http://fletcherpenney.net/mmd/>

Introduction
------------

QLMarkdown is a simple QuickLook generator for Markdown files. It renders a
preview of the selected Markdown file using [Discount][Discount] -- a C implementation of 
John Gruber's Markdown.pl script.

For more information on Markdown see 
<http://daringfireball.net/projects/markdown/>.

QLMultiMarkdown uses [MultiMarkdown 3.0] \(which must be installed separately)
to render previews of MultiMarkdown documents. It is *much* faster than the
perl version and more suitable to this sort of use than a perl script.

[MultiMarkdown 3.0]: https://github.com/fletcher/peg-multimarkdown/downloads


Installation
------------

Simply copy QLMarkdown.qlgenerator to ~/Library/QuickLook or /Library/QuickLook.

To uninstall, drag QLMarkdown into the trash.


Downloads
---------

Source code is available at <http://github.com/fletcher/qlmultimarkdown>.

You can download a binary release from <https://github.com/fletcher/qlmultimarkdown/downloads>.


License
-------

The QLMarkdown code is distributed under the same terms as [Discount][Discount]. See
the file `discount/COPYRIGHT` for more information.


Known Issues
------------

Images are not displayed in previews.


Version History
---------------

### qlmultimarkdown ###

Version 2.0 - Feb 26, 2011

* Initial MultiMarkdown support - replace previous quicklook app that used
  perl version of MMD


### qlmarkdown ###

Version 1.2 - Oct 4, 2009

* Work around a conflict with MacVim (thanks to godDLL)
* Support for .mdml extension (alanhogan)
* CSS that mimics Apple's ADC styling (jiho)

Version 1.1 - Feb 11, 2009

* Adding a little bit of CSS styling. (mdk)
* Replace the Perl markdown renderer with a native C one (discount). (mdk)
* Conform to public plain-text. Will make spotlight index the file
  contents. (mdk) 
* Added support for .md file extension (sant0sk1)

Version 1.0 - July 15, 2008

* Initial release.

[Discount]: http://www.pell.portland.or.us/~orc/Code/markdown/
