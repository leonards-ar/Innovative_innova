<g:render template="${grailsApplication.config.application.template + 'Print'}" model="[proformaInstance:proformaInstance, totalDetails:totalDetails,
              totalAmount:totalAmount, discountAmount: discountAmount]"/>