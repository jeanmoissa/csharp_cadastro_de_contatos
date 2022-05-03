using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private List<Contato> InserirContato(List<Contato> lst)
        {
            Contato contato = new Contato
            {
                Id = (lst.Any() ? lst.Max(x => x.Id) : 0) + 1,
                Nome = txtNome.Text,
                Email = txtEmail.Text,
                DataNascimento = DateTime.Parse(txtDataNascimento.Text).ToString("dd/MM/yyyy"),
                Cpf = FormatCPF(txtCpf.Text),
                Cidade = txtCidade.Text,
                Estado = txtEstado.SelectedValue,
                Endereco = txtEndereco.Text
            };
            lst.Add(contato);

            return lst;
        }

        public void GravarDados()
        {
            List<Contato> lst = new List<Contato>();
            if (Session["list"] != null)
            {
                lst = (List<Contato>)Session["list"];
            }

            lst = InserirContato(lst);

            Session["list"] = lst;

            gridContato.DataSource = lst;
            gridContato.DataBind();

            LimparCampos();

        }

        public Boolean VerificarCamposVazios()
        {
            if (String.IsNullOrWhiteSpace(txtNome.Text) || String.IsNullOrWhiteSpace(txtEmail.Text) || String.IsNullOrWhiteSpace(txtDataNascimento.Text) || String.IsNullOrWhiteSpace(txtCpf.Text))
                return false;
            else
                return true;
        }

        public void LimparCampos()
        {
            txtNome.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtDataNascimento.Text = String.Empty;
            txtCpf.Text = String.Empty;
            txtCidade.Text = String.Empty;
            txtEstado.Text = String.Empty;
            txtEndereco.Text = String.Empty;

            lblCampoInvalido.Text = String.Empty;

            btnSalvar.Visible = false;
            btnCadastrar.Visible = true;
        }

        public static string FormatCPF(string CPF)
        {
            return Convert.ToUInt64(CPF).ToString(@"000\.000\.000\-00");
        }

        public string SemFormatacao(string Codigo)
        {
            return Codigo.Replace(".", string.Empty).Replace("-", string.Empty).Replace("/", string.Empty);
        }

        public bool ValidarEmail()
        {
            var email = txtEmail.Text;

            Regex rg = new Regex(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$");

            if (rg.IsMatch(email))
                return true;
            
            else
            {
                lblCampoInvalido.Text = "Formato de e-mail inválido";
                return false;
            }
        }

        public void RemoverContato(object sender, GridViewDeleteEventArgs e)
        {

            List<Contato> lst = new List<Contato>();
            if (Session["list"] != null)
                lst = (List<Contato>)Session["list"];
            

            lst.RemoveAt(e.RowIndex);
            Session["list"] = lst;
            Aguardando(sender, e);
            gridContato.DataSource = lst;
            gridContato.DataBind();
            LimparCampos();
            uppForm.Update();
        }

        protected void BtnCadastrar_Click(object sender, EventArgs e)
        {

            if (VerificarCamposVazios() && ValidarEmail())
                GravarDados();
            
            else if (!VerificarCamposVazios())
                lblCampoInvalido.Text = "* Verifique os campos que são obrigatorios!";
            
            Aguardando(sender, e);
            uppTable.Update();

        }

        protected void BtnLimpar_Click(object sender, EventArgs e)
        {
            Aguardando(sender, e);
            LimparCampos();
            uppTable.Update();
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            List<Contato> lst = new List<Contato>();
            if (Session["list"] != null)
                lst = (List<Contato>)Session["list"];
            

            btnSalvar.Visible = true;
            btnCadastrar.Visible = false;

            int variavel = ((GridViewRow)((Button)sender).Parent.Parent).DataItemIndex;
            Session["verificaId"] = variavel;


            for (int i = 0; i < lst.Count; i++)
            {
                if (variavel == i)
                {
                    txtNome.Text = lst[i].Nome;
                    txtEmail.Text = lst[i].Email;
                    txtDataNascimento.Text = DateTime.Parse(lst[i].DataNascimento).ToString("yyyy-MM-dd");
                    txtCpf.Text = SemFormatacao(lst[i].Cpf);
                    txtCidade.Text = lst[i].Cidade;
                    txtEstado.Text = lst[i].Estado;
                    txtEndereco.Text = lst[i].Endereco;
                    break;
                }
            }
            uppForm.Update();
        }
        protected void BtnSalvar_Click(object sender, EventArgs e)
        {
            List<Contato> lst = new List<Contato>();
            if (Session["list"] != null)
                lst = (List<Contato>)Session["list"];
            

            for (int i = 0; i < lst.Count; i++)
            {
                if (((int)Session["verificaId"]) == i)
                {
                    lst[i].Id = ((int)Session["verificaId"]);
                    lst[i].Nome = txtNome.Text;
                    lst[i].Email = txtEmail.Text;
                    lst[i].DataNascimento = DateTime.Parse(txtDataNascimento.Text).ToString("dd/MM/yyyy");
                    lst[i].Cpf = FormatCPF(txtCpf.Text);
                    lst[i].Cidade = txtCidade.Text;
                    lst[i].Estado = txtEstado.Text;
                    lst[i].Endereco = txtEndereco.Text;
                    break;
                }
            }
            Aguardando(sender, e);
            gridContato.DataSource = lst;
            gridContato.DataBind();
            LimparCampos();
            uppTable.Update();
        }

        protected void Aguardando(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
        }
    }
}