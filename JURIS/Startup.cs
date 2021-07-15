using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JURIS.Startup))]
namespace JURIS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
