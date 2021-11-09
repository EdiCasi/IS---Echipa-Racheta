﻿using I_challenge_you_3._0.DataAccessLayers;
using I_challenge_you_3._0.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace I_challenge_you_3._0.Pages
{
    /// <summary>
    /// Interaction logic for ProfilePage.xaml
    /// </summary>
    public partial class ProfilePage : Page
    {
        public User loggedUser { get; set; }
        public ProfilePage(User user)
        {
            InitializeComponent();
            this.loggedUser = user;
            DataContext = this;
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}