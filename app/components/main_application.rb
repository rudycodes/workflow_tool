class MainApplication < Netzke::Basepack::SimpleApp

  js_base_class "Ext.tree.Panel"

  def configuration
    sup = super
    sup.merge(
        name: :main_application,
        padding: "20px",
        style: {border: "5px solid #A4A6A9",
                "-o-border-radius" => "10px",
                "-ms-border-radius" => "10px",
                "-moz-border-radius" => "10px",
                "-webkit-border-radius" => "30px",
                "border-radius" => "8px"
                },
        :items => [{
          :region => :north,
          :border => false,
          :height => 90,
          :html => %Q{
            <div style=margin-bottom:4px;text-align:right;color:grey;>You are logged in as <span style='color:#2A81C9;font-weight:bold'>#{user_info}</span>&nbsp;&nbsp;&nbsp;<a style='font-weight:bold;color:grey;' href='/signout'>Sign out</a>&nbsp;&nbsp;</div>
            <div style="text-align:center;">
              <img style='margin-top:-5px;margin-left:-8px;float:left;width:230px;height:50px;' src="/assets/logo.png"/>
            </div>
            <br/>
          },
          },{
            :region => :center,
            :layout => :border,
            :border => false,
            :items => [:navigation.component,
                       {region: :center,
                        border: false,
                        layout: :border,
                        items:

                          [status_bar_config,{
                             region: :center,
                             item_id: :main_panel,
                             frame: true,
                             border: true,
                             margin: 0,
                             status: false,
                             layout: :fit,
                             items: []
                          }]
                       }]
         }]
       )
  end

  def user_info
    "#{User.current.full_name}"
  end

  component :navigation do
    {
        class_name: "Navigation",
        region: :west,
    }
  end
  
end
