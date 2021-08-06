using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopGiayHHL.Startup))]
namespace ShopGiayHHL
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
