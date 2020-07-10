##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Wireless < Domain
      class V1 < Version
        class SimContext < InstanceContext
          class DataSessionList < ListResource
            ##
            # Initialize the DataSessionList
            # @param [Version] version Version that contains the resource
            # @param [String] sim_sid The SID of the [Sim
            #   resource](https://www.twilio.com/docs/wireless/api/sim-resource) that the Data
            #   Session is for.
            # @return [DataSessionList] DataSessionList
            def initialize(version, sim_sid: nil)
              super(version)

              # Path Solution
              @solution = {sim_sid: sim_sid}
              @uri = "/Sims/#{@solution[:sim_sid]}/DataSessions"
            end

            ##
            # Lists DataSessionInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] end_ The date that the record ended, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [Time] start The date that the Data Session started, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(end_: :unset, start: :unset, limit: nil, page_size: nil)
              self.stream(end_: end_, start: start, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams DataSessionInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] end_ The date that the record ended, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [Time] start The date that the Data Session started, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(end_: :unset, start: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(end_: end_, start: start, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields DataSessionInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of DataSessionInstance records from the API.
            # Request is executed immediately.
            # @param [Time] end_ The date that the record ended, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [Time] start The date that the Data Session started, given as GMT in [ISO
            #   8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of DataSessionInstance
            def page(end_: :unset, start: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'End' => Twilio.serialize_iso8601_datetime(end_),
                  'Start' => Twilio.serialize_iso8601_datetime(start),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              DataSessionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of DataSessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of DataSessionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              DataSessionPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Wireless.V1.DataSessionList>'
            end
          end

          class DataSessionPage < Page
            ##
            # Initialize the DataSessionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DataSessionPage] DataSessionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DataSessionInstance
            # @param [Hash] payload Payload response from the API
            # @return [DataSessionInstance] DataSessionInstance
            def get_instance(payload)
              DataSessionInstance.new(@version, payload, sim_sid: @solution[:sim_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Wireless.V1.DataSessionPage>'
            end
          end

          class DataSessionInstance < InstanceResource
            ##
            # Initialize the DataSessionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sim_sid The SID of the [Sim
            #   resource](https://www.twilio.com/docs/wireless/api/sim-resource) that the Data
            #   Session is for.
            # @return [DataSessionInstance] DataSessionInstance
            def initialize(version, payload, sim_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'sim_sid' => payload['sim_sid'],
                  'account_sid' => payload['account_sid'],
                  'radio_link' => payload['radio_link'],
                  'operator_mcc' => payload['operator_mcc'],
                  'operator_mnc' => payload['operator_mnc'],
                  'operator_country' => payload['operator_country'],
                  'operator_name' => payload['operator_name'],
                  'cell_id' => payload['cell_id'],
                  'cell_location_estimate' => payload['cell_location_estimate'],
                  'packets_uploaded' => payload['packets_uploaded'].to_i,
                  'packets_downloaded' => payload['packets_downloaded'].to_i,
                  'last_updated' => Twilio.deserialize_iso8601_datetime(payload['last_updated']),
                  'start' => Twilio.deserialize_iso8601_datetime(payload['start']),
                  'end_' => Twilio.deserialize_iso8601_datetime(payload['end']),
                  'imei' => payload['imei'],
              }
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Sim resource that the Data Session is for
            def sim_sid
              @properties['sim_sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The generation of wireless technology that the device was using
            def radio_link
              @properties['radio_link']
            end

            ##
            # @return [String] The 'mobile country code' is the unique ID of the home country where the Data Session took place
            def operator_mcc
              @properties['operator_mcc']
            end

            ##
            # @return [String] The 'mobile network code' is the unique ID specific to the mobile operator network where the Data Session took place
            def operator_mnc
              @properties['operator_mnc']
            end

            ##
            # @return [String] The three letter country code representing where the device's Data Session took place
            def operator_country
              @properties['operator_country']
            end

            ##
            # @return [String] The friendly name of the mobile operator network that the SIM-connected device is attached to
            def operator_name
              @properties['operator_name']
            end

            ##
            # @return [String] The unique ID of the cellular tower that the device was attached to at the moment when the Data Session was last updated
            def cell_id
              @properties['cell_id']
            end

            ##
            # @return [Hash] An object with the estimated location where the device's Data Session took place
            def cell_location_estimate
              @properties['cell_location_estimate']
            end

            ##
            # @return [String] The number of packets uploaded by the device between the start time and when the Data Session was last updated
            def packets_uploaded
              @properties['packets_uploaded']
            end

            ##
            # @return [String] The number of packets downloaded by the device between the start time and when the Data Session was last updated
            def packets_downloaded
              @properties['packets_downloaded']
            end

            ##
            # @return [Time] The date that the resource was last updated, given as GMT in ISO 8601 format
            def last_updated
              @properties['last_updated']
            end

            ##
            # @return [Time] The date that the Data Session started, given as GMT in ISO 8601 format
            def start
              @properties['start']
            end

            ##
            # @return [Time] The date that the record ended, given as GMT in ISO 8601 format
            def end_
              @properties['end_']
            end

            ##
            # @return [String] The unique ID of the device using the SIM to connect
            def imei
              @properties['imei']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Wireless.V1.DataSessionInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Wireless.V1.DataSessionInstance>"
            end
          end
        end
      end
    end
  end
end