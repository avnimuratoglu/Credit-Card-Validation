using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Homework1_1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string cardNo1 = cardNumber.Text; 
            string owner = txtOwner.Text; 
            string cvv = txtCVV.Text;
            DetectCardType(cardNumber.Text);

            if (string.IsNullOrWhiteSpace(cardNo1) || string.IsNullOrWhiteSpace(owner) || string.IsNullOrWhiteSpace(cvv))
            {
                lbl_error.Text = "Fill in all the required information.";
                return;
            }
            string cardNo = cardNumber.Text; 
            if (!checkLuhn(cardNo))
                lbl_error.Text = "This is not a valid card.";
        }
        public void DetectCardType(string cardNumber)
        {
        
            if ((cardNumber.Length == 13 || cardNumber.Length == 16) && cardNumber.StartsWith("4"))
            {
                MasterCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                AmexCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                VisaCardImage.BorderColor = ColorTranslator.FromHtml("#FF0066");
            }
          
            else if (cardNumber.Length == 16 &&
                     (cardNumber.StartsWith("51") || cardNumber.StartsWith("52") ||
                      cardNumber.StartsWith("53") || cardNumber.StartsWith("54") ||
                      cardNumber.StartsWith("55") ||
                      Enumerable.Range(2221, 499).Any(range => cardNumber.StartsWith(range.ToString()))))
            {
                AmexCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                VisaCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                MasterCardImage.BorderColor = ColorTranslator.FromHtml("#FF0066");
            }
           
            else if (cardNumber.Length == 15 &&
                     (cardNumber.StartsWith("34") || cardNumber.StartsWith("37")))
            {
                MasterCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                VisaCardImage.BorderColor = ColorTranslator.FromHtml("#FFFFFF");
                AmexCardImage.BorderColor = ColorTranslator.FromHtml("#FF0066");
            }
            else
            {
                lbl_error.Text = "!!! Unknown card type. !!!";
            }
        }


        static bool checkLuhn(String cardNo)
        {
            int nDigits = cardNo.Length;

            int nSum = 0;
            bool isSecond = false;
            for (int i = nDigits - 1; i >= 0; i--)
            {

                int d = cardNo[i] - '0';

                if (isSecond == true)
                    d = d * 2;

                nSum += d / 10;
                nSum += d % 10;

                isSecond = !isSecond;
            }
            return (nSum % 10 == 0);
        }
        protected void cardNumber_TextChanged(object sender, EventArgs e)
        {

            if (!cardNumber.Text.All(char.IsDigit))
                lbl_error.Text = "The card number must consist of numbers only.";
            else
            {
               
                if (checkLuhn(cardNumber.Text))
                    lbl_error.Text = "Card number is valid.";
                else
                    lbl_error.Text = "Card number is invalid.";

            }
        }

        protected void txtCVV_TextChanged(object sender, EventArgs e)
        {
            string ccv = txtCVV.Text;
            string cardNumber = txtCVV.Text;

            if (ccv.Length == 3 || ccv.Length == 4)
            {
                lbl_error.Text = "The CCV entered is valid.";
            }
            else
            {
                lbl_error.Text = "The CCV entered is invalid.";
            }
        }
    }

   
   
}