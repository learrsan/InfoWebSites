using System;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Label = System.Reflection.Emit.Label;

namespace InfoWebSites.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    public partial class VisualWebPart1 : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public VisualWebPart1()
        {
        }

        private Guid id;
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            using (var sitio = SPContext.Current.Site)  { 
            Label1.Text = sitio.Url;
            lstSitios.Items.Clear();

            foreach (SPWeb web in sitio.AllWebs)
            {
                lstSitios.Items.Add(new ListItem(web.Title, web.ID.ToString()));
            }
        }
    }

        protected void lstSitios_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCargado.Text = "Se lanzo el evento" + lstSitios.SelectedIndex;
            if (lstSitios.SelectedIndex != -1)
            {
                var guid = new Guid(lstSitios.SelectedValue);

                using (var web = SPContext.Current.Site.OpenWeb(guid))
                {
                    lblCargado.Text = web.Title + "<br>" +
                                      web.Name + "<br>" +
                                      web.Url + "<br>";

                    TextBox1.Text = web.Title;
                    id = guid;
                    ViewState["id"] = id;
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            id = (Guid) ViewState["id"];
            using (var web = SPContext.Current.Site.OpenWeb(id))
            {
                web.Title = TextBox1.Text;
                web.Update();
            }
        }
}
}