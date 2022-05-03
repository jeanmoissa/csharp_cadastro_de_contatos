<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cadastro de Contato</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script type="text/javascript" src="main.js"></script>

</head>

<body class="bg-dark">

    <form id="form1" runat="server" class="border border-secondary rounded p-5 mt-5 mb-5 bg-light container">

        <asp:ScriptManager ID="scriptM1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="uppForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="container text-center">
                    <asp:Image runat="server" Height="56px" ImageUrl="~/img/contato.png" Width="60px" class="border border-secondary rounded-circle bg-light bg-opacity-50" />
                    <asp:Label runat="server" CssClass="h2 opacity-75 mt-3 text-dark m-3">Cadastro de Contatos</asp:Label>
                </div>

                <asp:Label ID="lblCampoInvalido" runat="server" Text="" CssClass="form-label text-danger font-weight-bold"></asp:Label><br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lblNome" runat="server" Text="Nome<span class='text-danger ' >*</span>:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email<span class='text-danger'>*</span>:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDataNascimento" runat="server" Text="Nascimento<span class='text-danger'>*</span>:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDataNascimento" runat="server" TextMode="Date" CssClass="form-control" min="0001-01-01" max="9999-12-31">   ></asp:TextBox><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCpf" runat="server" Text="CPF<span class='text-danger'>*</span>:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtCpf" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" MinLength="11" MaxLength="11" CssClass="form-control"></asp:TextBox><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEstado" runat="server" Text="Estado:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="txtEstado" runat="server" CssClass="form-control">
                        <asp:ListItem Value="" />
                        <asp:ListItem Value="AC" Text="Acre" />
                        <asp:ListItem Value="AL" Text="Alagoas" />
                        <asp:ListItem Value="AP" Text="Amapá" />
                        <asp:ListItem Value="AM" Text="Amazonas" />
                        <asp:ListItem Value="BA" Text="Bahia" />
                        <asp:ListItem Value="CE" Text="Ceará" />
                        <asp:ListItem Value="DF" Text="Distrito Federal" />
                        <asp:ListItem Value="ES" Text="Espírito Santo" />
                        <asp:ListItem Value="GO" Text="Goiás" />
                        <asp:ListItem Value="MA" Text="Maranhão" />
                        <asp:ListItem Value="MT" Text="Mato Grosso" />
                        <asp:ListItem Value="MS" Text="Mato Grosso do Sul" />
                        <asp:ListItem Value="MG" Text="Minas Gerais" />
                        <asp:ListItem Value="PA" Text="Pará" />
                        <asp:ListItem Value="PB" Text="Paraíba" />
                        <asp:ListItem Value="PR" Text="Paraná" />
                        <asp:ListItem Value="PE" Text="Pernambuco" />
                        <asp:ListItem Value="PI" Text="Piauí" />
                        <asp:ListItem Value="RJ" Text="Rio de Janeiro" />
                        <asp:ListItem Value="RN" Text="Rio Grande do Norte" />
                        <asp:ListItem Value="RS" Text="Rio Grande do Sul" />
                        <asp:ListItem Value="RO" Text="Rondônia" />
                        <asp:ListItem Value="RR" Text="Roraima" />
                        <asp:ListItem Value="SC" Text="Santa Catarina" />
                        <asp:ListItem Value="SP" Text="São Paulo" />
                        <asp:ListItem Value="SE" Text="Sergipe" />
                        <asp:ListItem Value="TO" Text="Tocantins" />
                    </asp:DropDownList><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblCidade" runat="server" Text="Cidade:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"></asp:TextBox><br />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEndereco" runat="server" Text="Endereco:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEndereco" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group mt-3 mb-3">
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="BtnCadastrar_Click" CssClass="btn btn-outline-primary mr-5 rounded" />
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="BtnSalvar_Click" CssClass="btn btn-outline-primary mr-5 rounded" Visible="false" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" OnClick="BtnLimpar_Click" CssClass="btn btn-outline-secondary rounded" /><br />
                </div>

                </div>
            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnlimpar" EventName="Click" />
            </Triggers>

        </asp:UpdatePanel>

        <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="text-primary fw-bold">
            <ProgressTemplate>
                Atualizando...
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel runat="server" ID="uppTable" UpdateMode="Conditional">
            <ContentTemplate>

                <asp:GridView ID="gridContato" runat="server" CssClass="table table-hover container mb-5 mt-5 bg-light" OnRowDeleting="RemoverContato" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="Nome" HeaderText="Nome" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="DataNascimento" HeaderText="Data de Nascimento" Visible="false"/>
                        <asp:BoundField DataField="Cpf" HeaderText="CPF" Visible="false"/>
                        <asp:BoundField DataField="Cidade" HeaderText="Cidade" />
                        <asp:BoundField DataField="Estado" HeaderText="UF" />
                        <asp:BoundField DataField="Endereco" HeaderText="Endereço" />
                        <asp:CommandField HeaderText="Açoes" ControlStyle-CssClass="align-middle" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="BtnEditar_Click" CssClass="btn btn-outline-primary" />
                                <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CommandName="Delete" OnClientClick="return confirmarDel();" CssClass="btn btn-outline-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnCadastrar" EventName="Click" />
            </Triggers>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
            </Triggers>


        </asp:UpdatePanel>




    </form>

</body>
</html>
