section "Creating Settings" do
  Setting.create(key: "official_level_1_name",
                 value: I18n.t("seeds.settings.official_level_1_name"))
  Setting.create(key: "official_level_2_name",
                 value: I18n.t("seeds.settings.official_level_2_name"))
  Setting.create(key: "official_level_3_name",
                 value: I18n.t("seeds.settings.official_level_3_name"))
  Setting.create(key: "official_level_4_name",
                 value: I18n.t("seeds.settings.official_level_4_name"))
  Setting.create(key: "official_level_5_name",
                 value: I18n.t("seeds.settings.official_level_5_name"))
  Setting.create(key: "max_ratio_anon_votes_on_debates", value: "50")
  Setting.create(key: "max_votes_for_debate_edit", value: "1000")
  Setting.create(key: "max_votes_for_proposal_edit", value: "1000")
  Setting.create(key: "proposal_code_prefix", value: "MAD")
  Setting.create(key: "votes_for_proposal_success", value: "100")
  Setting.create(key: "months_to_archive_proposals", value: "12")
  Setting.create(key: "comments_body_max_length", value: "1000")

  Setting.create(key: "twitter_handle", value: "@consul_dev")
  Setting.create(key: "twitter_hashtag", value: "#consul_dev")
  Setting.create(key: "facebook_handle", value: "CONSUL")
  Setting.create(key: "youtube_handle", value: "CONSUL")
  Setting.create(key: "telegram_handle", value: "CONSUL")
  Setting.create(key: "instagram_handle", value: "CONSUL")
  Setting.create(key: "url", value: "http://localhost:3000")
  Setting.create(key: "org_name", value: "CONSUL")

  Setting.create(key: "process.debates", value: "true")
  Setting.create(key: "process.proposals", value: "true")
  Setting.create(key: "process.polls", value: "true")
  Setting.create(key: "process.budgets", value: "true")
  Setting.create(key: "process.legislation", value: "true")

  Setting.create(key: "feature.featured_proposals", value: "true")

  Setting.create(key: "feature.twitter_login", value: "true")
  Setting.create(key: "feature.facebook_login", value: "true")
  Setting.create(key: "feature.google_login", value: "true")
  Setting.create(key: "feature.signature_sheets", value: "true")
  Setting.create(key: "feature.user.recommendations", value: "true")
  Setting.create(key: "feature.user.recommendations_on_debates", value: "true")
  Setting.create(key: "feature.user.recommendations_on_proposals", value: "true")
  Setting.create(key: "feature.user.skip_verification", value: "true")
  Setting.create(key: "feature.community", value: "true")
  Setting.create(key: "feature.map", value: "true")
  Setting.create(key: "feature.allow_images", value: "true")
  Setting.create(key: "feature.allow_attached_documents", value: "true")
  Setting.create(key: "feature.public_stats", value: "true")
  Setting.create(key: "feature.help_page", value: "true")

  Setting.create(key: "feature.translation_interface", value: nil)
  Setting.create(key: "feature.remote_translations", value: nil)

  Setting.create(key: "html.per_page_code_head", value: "")
  Setting.create(key: "html.per_page_code_body", value: "")

  Setting.create(key: "comments_body_max_length", value: "1000")
  Setting.create(key: "mailer_from_name", value: "CONSUL")
  Setting.create(key: "mailer_from_address", value: "noreply@consul.dev")
  Setting.create(key: "meta_title", value: "CONSUL")
  Setting.create(key: "meta_description", value: "Citizen participation tool for an open, "\
                                                 "transparent and democratic government")
  Setting.create(key: "meta_keywords", value: "citizen participation, open government")
  Setting.create(key: "min_age_to_participate", value: "16")
  Setting.create(key: "map.latitude", value: 40.4332002)
  Setting.create(key: "map.longitude", value: -3.7009591)
  Setting.create(key: "map.zoom", value: 10)

  Setting.create(key: "featured_proposals_number", value: 3)
  Setting.create(key: "proposal_notification_minimum_interval_in_days", value: 0)
  Setting.create(key: "direct_message_max_per_day", value: 3)

  Setting.create(key: "related_content_score_threshold", value: -0.3)
  Setting.create(key: "hot_score_period_in_days", value: 31)

  Setting.create(key: "homepage.widgets.feeds.proposals", value: "true")
  Setting.create(key: "homepage.widgets.feeds.debates", value: "true")
  Setting.create(key: "homepage.widgets.feeds.processes", value: "true")

  Setting.create(key: "proposals.successful_proposal_id", value: nil)
  Setting.create(key: "proposals.poll_short_title", value: nil)
  Setting.create(key: "proposals.poll_description", value: nil)
  Setting.create(key: "proposals.poll_link", value: nil)
  Setting.create(key: "proposals.email_short_title", value: nil)
  Setting.create(key: "proposals.email_description", value: nil)

  Setting.create(key: "dashboard.emails", value: nil)
end
