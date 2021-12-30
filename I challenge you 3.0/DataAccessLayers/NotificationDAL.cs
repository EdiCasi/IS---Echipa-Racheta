﻿using I_challenge_you_3._0.DataAccessLayer;
using I_challenge_you_3._0.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace I_challenge_you_3._0.DataAccessLayers
{
    class NotificationDAL
    {
        public static void CreateNotification(Notification notif)
        {
            using (SqlConnection con = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("createNotification", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userId", SqlDbType.Int).Value = notif.IdUser;
                cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = notif.Type;
                if(notif.IdPost == null)
                {
                    cmd.Parameters.Add("@postId", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@postId", SqlDbType.Int).Value = notif.IdPost;
                }
                if(notif.MessageFrom == null)
                {
                    cmd.Parameters.Add("@messageFrom", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@messageFrom", SqlDbType.Int).Value = notif.MessageFrom;
                }
                cmd.Parameters.Add("@creationDate", SqlDbType.Date).Value = notif.CreationDate;
                cmd.Parameters.Add("seen", SqlDbType.Bit).Value = notif.Seen;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static Notification GetNotificationByMessageFrom(int userId, int messageFrom)
        {
            using (SqlConnection con = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("getNotificationByMessageFrom", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userId", SqlDbType.Int).Value = userId;
                cmd.Parameters.Add("@messageFrom", SqlDbType.Int).Value = messageFrom;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Notification notif = new Notification()
                    {
                        IdNotification = (int)reader["notificationId"],
                        IdUser = (int)reader["userId"],
                        Type = reader["type"].ToString(),
                        CreationDate = DateTime.Parse(reader["creationDate"].ToString()),
                    };

                    if(reader["postId"] != DBNull.Value)
                    {
                        notif.IdPost = (int)reader["postId"];
                    }
                    else
                    {
                        notif.IdPost = null;
                    }

                    if (reader["messageFrom"] != DBNull.Value)
                    {
                        notif.MessageFrom = (int)reader["messageFrom"];
                    }
                    else
                    {
                        notif.MessageFrom = null;
                    }

                    if(reader["seen"].ToString() == "1")
                    {
                        notif.Seen = true;
                    }
                    else
                    {
                        notif.Seen = false;
                    }

                    return notif;
                }
                reader.Close();

            }
            return null;
        }

        public static bool UpdateMessageNotification(Notification notif)
        {
            using (SqlConnection con = DALHelper.Connection)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("changeMessageNotification", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@userId", SqlDbType.Int).Value = notif.IdUser;
                    cmd.Parameters.Add("@messageFrom", SqlDbType.Int).Value = notif.MessageFrom;
                    cmd.Parameters.Add("@creationDate", SqlDbType.DateTime).Value = notif.CreationDate;
                    cmd.Parameters.Add("@seen", SqlDbType.Bit).Value = notif.Seen? 1 : 0;
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return true;
                }
                catch (Exception)
                {
                    con.Close();
                    return false;
                }
            }
        }

        public static int GetNotificationCount(int userId)
        {
            using (SqlConnection con = DALHelper.Connection)
            {
                SqlCommand cmd = new SqlCommand("getNotificationCount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userId", SqlDbType.VarChar).Value = userId;
                con.Open();

                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
