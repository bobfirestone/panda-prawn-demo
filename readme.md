## This is a demo of the generating a pdf in ruby using prawn and a bunch of pandas

### Run the script with

    $ ruby prawn.rb


For the demo I broke things out into small classes to make it easier to follow what is going on.

1. That will create a new PdfGenerateBoth object
2. It calls PdfGenerate to create the custom pdf
3. it calls PdfConcat to take the pdf we generated and then appends the additional pre existing pdf's to it.

PdfGenerate & PdfConcat both call Prawn::Document.generate()

